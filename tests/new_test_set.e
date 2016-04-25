note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	NEW_TEST_SET

inherit
	EQA_TEST_SET
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	test_masque
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			masque:MASQUE
			width,height:INTEGER
		do
			game_library.enable_video

			width:= 500
			height:=600

			create masque.make_as_mask (width, height)

			assert("Width set", masque.width = width)
			assert("Height set", masque.height = height)

			game_library.quit_library
		end


end

