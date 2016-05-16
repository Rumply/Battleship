note
	description : "Battleship application root class"
	date        : "1 Mars 2016"
	revision    : "1.5"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'
	TEXT_LIBRARY_SHARED		-- To use `text_library'

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_engine:detachable MAIN_ENGINE
		do
			game_library.enable_video -- Enable the video functionalities
			image_file_library.enable_image (true, true, false)  -- Enable PNG image, JPG image (but not TIF).
			text_library.enable_text
			audio_library.enable_sound
			create l_engine.make
			l_engine.run_game  -- Run the core creator of the game.
			l_engine := Void
			game_library.clear_all_events
			audio_library.quit_library  -- Correctly unlink audio files library
			text_library.quit_library	-- Correctly unlink text files library
			image_file_library.quit_library  -- Correctly unlink image files library
			game_library.quit_library  -- Clear the library before quitting
		end

end
