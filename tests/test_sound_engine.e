note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_SOUND_ENGINE

inherit
	EQA_TEST_SET
	AUDIO_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	test_sound_engine_set_bufferSize
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			audio:SOUND_ENGINE
		do
			audio_library.disable_sound

			create audio.make_environment


			audio.source.set_buffer_size (3000)
			assert ("Positive buffersize set: ", audio.source.buffer_size = 3000)


			audio_library.quit_library
		end

end


