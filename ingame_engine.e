note
	description: "[
				Classe qui fait un surlignement de l'emplacement en jeu du curseur. La
				Classe contrôle aussi les sons dès le moment où l'application est lancée.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "6 avri 2016"
	revision: "1.0"

class
	INGAME_ENGINE

inherit
	GAME_LIBRARY_SHARED
	IMG_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED
	CONSOLE_SHARED

create
	make

feature {NONE}

	make(a_window:GAME_WINDOW_SURFACED)
		-- Routine qui lance le menu et la musique dès le lancement de l'application.
		require
			a_window_is_open: a_window.surface.is_open
		do
			window := a_window
			create music_menu.make
			create menu.make (window,music_menu)

			music_menu.environement_audio.add ("theme1.wav", 1)
			music_menu.environement_audio.add ("theme2.wav", -1)
			music_menu.environement_audio.play

			menu.speaker_on

			if attached console as l_console then
				my_mutex:=l_console.my_mutex
			else
				create my_mutex.make
			end

			create network.make
			create keyboard.make

			input_buffer:=""
		ensure
			music_menu_is_playing: music_menu.environement_audio.source.is_open
			music_menu_is_playing: music_menu.environement_audio.source.is_playing
		end

feature

	run_game
			-- Crée les ressources et lance le jeu.
		do
			game_library.quit_signal_actions.extend(agent on_quit(?))
			game_library.iteration_actions.extend (agent cycle(?))
			window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?))	-- Lorsque l'utilisateur bouge son curseur sur l'écran.
			window.mouse_button_pressed_actions.extend (agent on_mouse_click(?,?,?))
			window.key_pressed_actions.extend (agent on_key_pressed(?,?))
			game_library.launch
		end

feature {NONE} -- Implementation

	cycle(a_timestamp: NATURAL_32)
		-- Routine qui fait les mises à jours de l'écran et des sons.
		do
			menu.cycle
			window.update
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		-- Routine qui fait les mises à jours de l'écran et des sons par rapport à ce que l'utilisateur fait en ce moment.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y

			menu.left_mouse_click (last_x, last_y,False)

			window.update
			audio_library.update
		end


	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		-- Routine qui est lancé lorsqu'un bouton de la souris à été appuyer.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y

			if (a_mouse_state.is_left_button_pressed) then
				menu.left_mouse_click (last_x, last_y,True)
			elseif (a_mouse_state.is_right_button_pressed) then
				menu.right_mouse_click (last_x, last_y)
			end

			window.update
			audio_library.update
		end

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
		-- Routine qui est lancé lorsqu'un touche du clavier à été appuyé.
		-- Elle gère certaine touche et fait quelque chose dépendament quelle à été appuyé.
		local
			l_input:STRING
		do
			if attached console as l_console then
				l_input:=keyboard.get_key (a_key_state)
				if l_input.count = 1 then
					l_console.clear
					input_buffer:= input_buffer + l_input
					l_console.write (input_buffer) 	-- Pour le moment ils sont écrit dans la console, mais lorsque
													-- la boite de chat sera implémenté, ils iront dans la boite de chat.
				elseif l_input.is_equal ("backspace") and (input_buffer.count > 0) then
					input_buffer:=input_buffer.substring (1, input_buffer.count-1)
					l_console.clear
					if input_buffer.count > 0 then
						l_console.write (input_buffer)
					end
				elseif l_input.is_equal ("esc") then
					return_to_main_menu
				end
			end
		end

	return_to_main_menu
		-- Routine qui crée et run le menu principale. Quand fini la librairie se ferme
		-- et alors tout les parent de `Current' vont fermer.
		local
			l_engine:MAIN_ENGINE
		do
			game_library.clear_all_events
			music_menu.environement_audio.source.stop
			create l_engine.make_from_window(window)
			l_engine.run_game
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Cette routine ferme la librairie, lorsque le bouton X à été appuyer
		do
			game_library.stop  -- Arrête le controller en boucle.
		end


feature {NONE} -- Access

	menu:INGAME_SCREEN

	input_buffer:STRING

	window:GAME_WINDOW_SURFACED

	music_menu:SPEAKER

	last_x, last_y:INTEGER
			-- Les dernières positions (x,y) de la sourie.

	network:RESEAU

	my_mutex:MUTEX

	keyboard:KEYBOARD

end
