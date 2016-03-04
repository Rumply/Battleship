note
	description: "Game engine pour le menu principal."
	author: ""
	date: "$1 Mars 2016$"
	revision: "$1.0$"

class
	GAME_ENGINE

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'
create
	make

feature {NONE}

	make
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
		do
			--io.default_output.
			l_window_builder.set_dimension (1500,1000)
			l_window_builder.set_title("BattleShip")
			window := l_window_builder.generate_window
			create menu.make_menu (window)
			create musique_menu.make_environment
			musique_menu.add ("theme1.wav", 1)
			musique_menu.add ("theme2.wav", 1)
			musique_menu.play
		end

feature

	run_game
			-- Create ressources and launch the game
		do
			game_library.quit_signal_actions.extend(agent on_quit(?))
			game_library.iteration_actions.extend (agent cycle(?))
			window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?))	-- When the user move the mouse on the window
			window.mouse_button_pressed_actions.extend (agent on_mouse_click(?,?,?))
			game_library.launch
		end

feature {NONE} -- Implementation

	cycle(a_timestamp: NATURAL_32)
		do
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
	local
			l_x:INTEGER
			l_y:INTEGER
		do
			l_x:=a_mouse_state.x
			l_y:=a_mouse_state.y
			menu.mouse_click (musique_menu, l_x, l_y,False)

		window.update
		audio_library.update
	end

	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; something: NATURAL_8)
		local
			l_x:INTEGER
			l_y:INTEGER
		do
			l_x:=a_mouse_state.x
			l_y:=a_mouse_state.y
			menu.mouse_click (musique_menu, l_x, l_y,True)

			window.update
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end

feature {NONE} -- Access

	menu:MAIN_MENU
	window:GAME_WINDOW_SURFACED
	musique_menu:SOUND_ENGINE

end
