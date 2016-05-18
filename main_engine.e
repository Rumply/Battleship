note
	description: "[
				Classe qui gère l'application dans son apparence soit, la grosseure limite
				de l'écran, les sons dans le jeu, les images et les moments où est-ce que
				l'utilisateur appuis à l'emplacement de son curseur.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "16 mai 2016"
	revision: "1.3"

class
	MAIN_ENGINE

inherit
	ENGINE
		rename
			make as make_engine
		redefine
			manage_input,
			manage_mouse_move,
			manage_mouse_click,
			manage_command
		end

create
	make,
	make_from_window

feature {NONE}

	make
	-- Routine qui crée la fenêtre avec la résolution de l'écran principale de l'usager, le menu et la musique.
		do
			make_engine

			create menu.make (window, music_menu)
			setup_music
		ensure
			music_menu_is_open: music_menu.environement_audio.source.is_open
			music_menu_is_playing: music_menu.environement_audio.source.is_playing
		end

	make_from_window(a_window:GAME_WINDOW_SURFACED)
		-- Routine qui crée le menu et la musique. Il faut une fenêtre préexistante.
		require
			a_window_is_open: a_window.surface.is_open
		do
			make_engine
			setup_music
			create menu.make (a_window, music_menu)
		ensure
			music_menu_is_playing: music_menu.environement_audio.source.is_open
			music_menu_is_playing: music_menu.environement_audio.source.is_playing
		end

	setup_music
		-- Setup la musique disponible dans cette engine.
		do
			music_menu.environement_audio.add ("theme2.wav", 1)
			music_menu.environement_audio.add ("theme1.wav", 1)
			music_menu.environement_audio.play
		end

feature {NONE} -- Implementation

	manage_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		-- Routine qui gère les mouvements de la souris.
		do
			menu.mouse_click (music_menu, last_x, last_y,False)
		end

	manage_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		-- Routine qui gère les clicks de la souris.
		local
			game: detachable INGAME_ENGINE
		do
			menu.mouse_click (music_menu, last_x, last_y,True)

			if menu.singlegame then
				game_library.clear_all_events
				music_menu.environement_audio.source.stop
				create game.make
				game.run_game

				last_x:=0
				last_y:=0
				make_from_window (window)
				game:=void
				run_game
			else
				audio_library.update
				window.update
			end

		end

	manage_input(a_input:STRING; a_console:MESSAGE_CONSOLE)
		-- Routine qui gère les touches du clavier.
		do
			if a_input.is_equal ("esc") then
				game_library.stop  -- Arrête le controller en boucle.
			elseif a_input.is_equal ("return") then
				console.clear
				console.write_new_line (input_buffer)
			end
		end

	manage_command
		-- Cette routine gère les commandes avec le contenu de `input_buffer'.
		local
			list_command:LIST[STRING_8]
		do
			list_command:=input_buffer.split (' ')
			if list_command.count > 0 then
				if list_command.at (1).is_equal ("connect") then
					command.connect (list_command.at (2), network)
				elseif list_command.at (1).is_equal ("host") then
					command.host(network)
				elseif list_command.at (1).is_equal ("msg") then
					if list_command.count > 1 then
						command.msg (list_command.at (2), network)
					end
				elseif list_command.at (1).is_equal ("read") then
					if attached command.read (network) as message then
						console.write_new_line (message)
					end
				end
			end
		end

feature {NONE} -- Access

	menu:MAIN_MENU

end
