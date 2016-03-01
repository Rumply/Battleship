note
	description : "Battleship application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	EXCEPTIONS


create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			die(1)
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
			l_window:GAME_WINDOW_SURFACED
		do
			create l_window_builder
			l_window_builder.set_dimension (100,100)
			l_window_builder.set_title("Premier teste")
			l_window := l_window_builder.generate_window
			game_library.quit_signal_actions.extend(agent on_quit)
			game_library.launch
		end
feature {NONE} -- Implementation

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end
end
