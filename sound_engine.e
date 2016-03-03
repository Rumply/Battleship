note
	description: "This application play ogg files passed in argument. The argument must be a ogg sound file."
	author: "Francis Mathieu"
	date: "$Date$"
	revision: "$Revision$"

class
	SOUND_ENGINE

inherit
		AUDIO_LIBRARY_SHARED -- Enable the `audio_library' functionnality
create
	make_environment

feature {NONE}

	make_environment
		do
			path:="./ressource/son/"
			bufferSize:=64000
			create environment
			audio_library.sources_add -- Add a sound source in the audio context.
			source:=audio_library.last_source_added
			muted:=False
		end

feature -- Access

	play
		do
			if not source.is_playing then
				source.play
			end
		end

	pause
		do
			if source.is_playing then
				source.pause
			end
		end

	mute
		do
			if source.is_playing then
				source.set_gain(0)
				muted:=True
			end
		end

	unmute
		do
			if source.is_playing then
				source.set_gain (1)
				muted:=False
			end
		end

	continue
		do
			if source.is_pause then
				source.play
			end
		end


	add(a_filename:READABLE_STRING_GENERAL; a_nb_loop:INTEGER)
		local
			l_filePath:STRING_32
			l_sound:AUDIO_SOUND_FILE
		do
			l_filePath:=path
			l_filePath.append_string_general (a_filename)
			create l_sound.make (l_filePath)
			if l_sound.is_openable then
				l_sound.open
				if l_sound.is_open then
					source.queue_sound_loop (l_sound, a_nb_loop)
				else
					has_error := True
				end
			else
				has_error := True
			end
		end

	muted:BOOLEAN

	environment:EXECUTION_ENVIRONMENT

	source:AUDIO_SOURCE

	path:STRING_32

	has_error:BOOLEAN

	bufferSize:INTEGER assign set_bufferSize
			-- Horizontal position of `Current'

	set_bufferSize(a_bufferSize:INTEGER)
			-- Assign the value of `bufferSize' with `a_bufferSize'
		do
			bufferSize := a_bufferSize
			source.set_buffer_size (bufferSize)
		ensure
			Is_Assign: bufferSize = a_bufferSize
		end

end
