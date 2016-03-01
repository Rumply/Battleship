note
	description: "This application play ogg files passed in argument. The argument must be a ogg sound file."
	author: "Francis Mathieu"
	date: "$Date$"
	revision: "$Revision$"

class
	SOUND

inherit
		AUDIO_LIBRARY_SHARED -- Enable the `audio_library' functionnality

create
	make

feature {NONE}

	make
			-- Run application
		do
			audio_library.enable_sound -- Permit to the Audio
			run_player
			audio_library.quit_library -- Properly quit the library
		end

	run_player

		local
			l_source:AUDIO_SOURCE
			l_sound:AUDIO_SOUND_FILE
			l_environment:EXECUTION_ENVIRONMENT
		do
			create l_environment
			audio_library.sources_add -- Add a sound source in the audio context.
			l_source:=audio_library.last_source_added
			create l_sound.make("PN_Try_This.ogg")
			l_sound.open
			l_source.queue_sound_loop(l_sound,1)
			from l_source.play
			until not l_source.is_playing
			loop
				l_environment.sleep (10000000) -- Put a loop delay to remove the CPU time.
				audio_library.update -- This line is very important. If it is not executed reguraly, the source will stop playing.
			end
		end


end
