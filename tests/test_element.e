note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "26 avril 2016"
	revision: "1.0"
	testing: "type/manual"

class
	TEST_ELEMENT

inherit
	EQA_TEST_SET
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	test_is_on
			-- New test routine
		note
			testing: "execution/isolated"
		local
			element:MASQUE
			mouse_x,mouse_y,width,height:INTEGER
		do
			game_library.enable_video


			create element.make(100,100)

			mouse_x:= 0
			mouse_y:= 0
			width:= 17
			height:= 18

			element.position.x:= 0
			element.position.y:= 0
			element.gamedimension.width:= 17
			element.gamedimension.height:= 18

			element.is_on (mouse_x, mouse_y)
			assert("mouse is hover", element.hover)
			element.is_on (element.gamedimension.width+2, mouse_y)
			assert("mouse is not hover", not element.hover)

			game_library.quit_library
		end

end


