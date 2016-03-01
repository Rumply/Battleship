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
			l_background:ELEMENT
			l_window:GAME_WINDOW_SURFACED
		do
			create l_background
			if not l_background.has_error then
				create l_window_builder

				l_window_builder.set_dimension (500,500)
				l_window_builder.set_title("Premier teste")
				l_window := l_window_builder.generate_window
				game_library.quit_signal_actions.extend(agent on_quit)
				cycle(l_background, l_window)
				--game_library.iteration_actions.extend (agent cycle(?, l_background, l_window))
				game_library.launch
			else
				print("Cannot create the background surface.")
			end
		end

feature {NONE} -- Implementation

	cycle(a_background:ELEMENT; a_window:GAME_WINDOW_SURFACED)
			-- Event that is launch at each iteration.
		do
			fill_background(a_background,a_window)

			-- Update modification in the screen
			a_window.update
		end

	fill_background(a_background:ELEMENT; a_window:GAME_WINDOW_SURFACED)
		local
			width,height,l_Wreste,l_Hreste,l_x,l_y:INTEGER
		do
			-- Draw the scene
			width:=a_background.width.to_integer
			height:=a_background.height.to_integer
			l_x:=0
			l_y:=0

			from
				l_Hreste:=a_window.height.to_integer
			until
				l_Hreste <= 0
			loop
				from
					l_Wreste:=a_window.width.to_integer
				until
					l_Wreste <= 0
				loop
					l_Wreste:= l_Wreste - width
					a_window.surface.draw_surface(a_background, l_x, l_y)
					l_x:= l_x + width
				end
				l_x:=0
				l_Hreste:= l_Hreste - height
				a_window.surface.draw_surface(a_background, l_x, l_y)
				l_y:= l_y + height
			end
		end

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end
end
