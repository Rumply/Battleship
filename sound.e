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
		local
			l_source:AUDIO_SOURCE
			l_sound:AUDIO_SOUND_FILE
			l_environment:EXECUTION_ENVIRONMENT
		do
			create l_environment
			audio_library.sources_add -- Add a sound source in the audio context.
			l_source:=audio_library.last_source_added
			create l_sound.make("teste2.wav")
			l_sound.open
			l_source.queue_sound_loop(l_sound,1)
			l_source.set_buffer_size (64000)
			--l_source.set_gain (0.2)

			l_source.play
		end



end
