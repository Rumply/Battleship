note
	description: "[
				Classe qui gère l'application dans son apparence soit, la grosseure limite
				de l'écran, les sons dans le jeu, les images et les moments où est-ce que
				l'utilisateur appuis à l'emplacement de son curseur.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "1 Mars 2016"
	revision: "1.0"

class
	MAIN_ENGINE

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'

create
	make,
	make_from_window

feature {NONE}

	make
	-- Routine qui crée la fenêtre avec la résolution de l'écran principale de l'usager, le menu et la musique.
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
			l_display_info:GAME_DISPLAY
		do
			create l_display_info.make (0)
			display_mode:=l_display_info.current_mode
			l_window_builder.set_dimension (display_mode.width,display_mode.height)
			l_window_builder.enable_border
			l_window_builder.set_title("BattleShip")
			window := l_window_builder.generate_window
			window.put_border
			window.maximize
			create menu.make (window)
			create musique_menu.make_environment

			create last_x.make_from_reference (0)
			create last_y.make_from_reference (0)

			musique_menu.add ("theme2.wav", 1)
			musique_menu.add ("theme1.wav", 1)
			musique_menu.play
		ensure
			musique_menu_is_playing: musique_menu.source.is_open
			musique_menu_is_playing: musique_menu.source.is_playing
		end

	make_from_window(a_window:GAME_WINDOW_SURFACED)
		-- Routine qui crée le menu et la musique. Il faut une fenêtre préexistante.
		require
			a_window_is_open: a_window.surface.is_open
		local
			l_display_info:GAME_DISPLAY
		do
			create l_display_info.make (0)
			display_mode:=l_display_info.current_mode
			window := a_window
			create musique_menu.make_environment
			create menu.make (window)

			create last_x.make_from_reference (0)
			create last_y.make_from_reference (0)

			musique_menu.add ("theme2.wav", 1)
			musique_menu.add ("theme1.wav", 1)
			musique_menu.play
		ensure
			musique_menu_is_playing: musique_menu.source.is_open
			musique_menu_is_playing: musique_menu.source.is_playing
		end

feature

	run_game
			-- Cette routine ajoute des events au controler de la librarie et de la fenêtre, puis lance la librairie.
--		local
--			l_font:TEXT_FONT -- Pas encore implémenté
		do
			game_library.quit_signal_actions.extend(agent on_quit(?))
			game_library.iteration_actions.extend (agent cycle(?))
			window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?))	-- When the user move the mouse on the window
			window.mouse_button_pressed_actions.extend (agent on_mouse_click(?,?,?))

			game_library.launch
			game_library.quit_library
		end

feature {NONE} -- Implementation

	cycle(a_timestamp: NATURAL_32)
		-- Routine qui fait les mises à jours de l'écran et de la librairie de son.
		do
			window.update
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		-- Routine qui garde en mémoire l'emplacement du curseur lors de ses mouvements. Puis lance la gestion de clics.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y

			menu.mouse_click (musique_menu, last_x, last_y,False)

			window.update
			audio_library.update
		end


	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		-- Routine qui garde en mémoire les actions du curseur lorsqu'un click est effectué.
		local
			game:INGAME_ENGINE
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y
			menu.mouse_click (musique_menu, last_x, last_y,True)

			if menu.singlegame then
				game_library.clear_all_events
				musique_menu.source.stop
				create game.make(window)
				game.run_game
			end

			window.update
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Cette routine ferme la librairie, lorsque le bouton X à été appuyer
		do
			game_library.stop  -- Arrête le controller en boucle.
		end

feature {NONE} -- Access

	menu:MAIN_MENU
	window:GAME_WINDOW_SURFACED
	musique_menu:SOUND_ENGINE

	last_x, last_y:INTEGER
			-- Les dernières positions (x,y) de la sourie.

	display_mode:GAME_DISPLAY_MODE

end
