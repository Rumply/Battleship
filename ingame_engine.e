note
	description: "Summary description for {INGAME_ENGINE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INGAME_ENGINE

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'

create
	make

feature {NONE}

	make(a_window:GAME_WINDOW_SURFACED)
		do

			window := a_window
			create menu.make (window)
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
			window.update
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y

			menu.mouse_click (musique_menu, last_x, last_y,False)

			window.update
			audio_library.update
		end


	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y
			menu.mouse_click (musique_menu, last_x, last_y,True)

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
	musique_menu:SOUND_ENGINE

	last_x, last_y:INTEGER
			-- Last known coordinate of the mouse pointer inside the window

end
