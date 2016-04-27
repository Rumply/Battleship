note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "26 avril 2016"
	revision: "1.0"
	testing: "type/manual"

class
	TEST_VISEUR

inherit
	EQA_TEST_SET
	AUDIO_LIBRARY_SHARED
		undefine
			default_create
		end
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	test_make_viseur
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			viseur:VISEUR
			dimension_test: TUPLE [width,height:INTEGER_32]
		do
			game_library.enable_video
			audio_library.enable_sound

			create dimension_test
			dimension_test.width:=200
			dimension_test.height:=300
			create viseur.make (dimension_test)

			assert ("Set width:", dimension_test.width = viseur.surface.gamedimension.width)
			assert ("Set height:", dimension_test.height = viseur.surface.gamedimension.height)

			audio_library.quit_library
			game_library.quit_library
		end

end


