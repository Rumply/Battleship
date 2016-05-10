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

			game_library.launch
		end

feature {NONE} -- Implementation

	cycle(a_timestamp: NATURAL_32)
		-- Routine qui fait les mises à jours de l'écran et des sons.
		do
			window.update
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		-- Routine qui fait les mises à jours de l'écran et des sons par rapport à ce que l'utilisateur fait en ce moment.
		-- Si l'utilisateur appuie sur le haut-parleur, la routine met le BOOLEAN à False.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y

			menu.mouse_click (last_x, last_y,False)

			window.update
			audio_library.update
		end


	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		-- Routine qui fait les mises à jours de l'écran et des sons par rapport à ce que l'utilisateur fait en ce moment.
		-- Si l'utilisateur n'appuie pas sur le haut-parleur lors du lancement de l'application, la routine laisse le BOOLEAN à True.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y
			menu.mouse_click (last_x, last_y,True)

			window.update
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end

feature {NONE} -- Access

	menu:INGAME_SCREEN

	window:GAME_WINDOW_SURFACED

	music_menu:SPEAKER

	last_x, last_y:INTEGER
			-- Last known coordinate of the mouse pointer inside the window

end
