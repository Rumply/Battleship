note
	description : "Battleship application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			game_library.enable_video -- Enable the video functionalities
			image_file_library.enable_image (true, true, false)  -- Enable PNG image, JPG image (but not TIF).
			run_game  -- Run the core creator of the game.
			image_file_library.quit_library  -- Correctly unlink image files library
			game_library.quit_library  -- Clear the library before quitting
		end

	run_game
			-- Create ressources and launch the game
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
			l_menu:MAIN_MENU
			l_window:GAME_WINDOW_SURFACED
			l_sound:SOUND
		do
			create l_window_builder
			l_window_builder.set_dimension (1500,1000)
			l_window_builder.set_title("Premier teste")
			l_window := l_window_builder.generate_window
			create l_menu.make_menu (l_window)
			game_library.quit_signal_actions.extend(agent on_quit)
			create l_sound.make
			l_window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?, l_window, l_menu))	-- When the user move the mouse on the window
			game_library.launch
		end

feature {NONE} -- Implementation

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32;a_window:GAME_WINDOW_SURFACED; a_menu:MAIN_MENU)
	local
		l_x:INTEGER
		l_y:INTEGER
		hover1:BOOLEAN
		hover2:BOOLEAN
	do
		l_x:=a_mouse_state.x
		l_y:=a_mouse_state.y
		hover1:=False
		hover2:=False

		if l_x>a_menu.bouton1.x and l_x<(a_menu.bouton1.x+a_menu.btn_width) then
			if l_y>a_menu.bouton1.y and l_y<(a_menu.bouton1.y+a_menu.btn_height)then
				hover1:=True
			else
				hover1:=False
			end
		else
			hover1:=False
		end

		if l_x>a_menu.bouton2.x and l_x<(a_menu.bouton2.x+a_menu.btn_width) then
			if l_y>a_menu.bouton2.y and l_y<(a_menu.bouton2.y+a_menu.btn_height)then
				hover2:=True
			else
				hover2:=False
			end
		else
			hover2:=False
		end

		if hover1 then
			a_menu.hover_button_1
		else if hover2 then
			a_menu.hover_button_2
		end

		end

		if not hover1 then
			a_menu.normal_button_1
		end

		if not hover2 then
			a_menu.normal_button_2
		end

		a_window.update
	end

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end

end
