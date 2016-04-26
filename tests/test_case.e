note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "26 avril 2016"
	revision: "1.0"
	testing: "type/manual"

class
	TEST_CASE

inherit
	EQA_TEST_SET
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	test_case
			-- New test routine
		note
			testing: "execution/isolated"
		local
			case:CASE
			x,y,width,height,bordure:INTEGER
		do
			game_library.enable_video

			x:= 0
			y:= 0
			width:= 100
			height:= 100
			bordure:= 10

			create case.make(x, y, width, height, bordure)

			assert("x set", case.position.x = x)
			assert("y set", case.position.y = y)
			assert("Width set", case.width = width)
			assert("Height set", case.height = height)
			assert("Bordure set", case.bordure = bordure)

			game_library.quit_library
		end

end


