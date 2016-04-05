note
	description: "Cette application joue un fichier ogg placé en argument. Cet argument doit être un fichier ogg."
	author: "Francis Mathieu"
	date: "5 avril 2016"
	revision: "1.0"

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
			source.gain:=0.2
			muted:=False
		end

feature -- Access

	play
		-- Routine qui fait jouer de la musique.
		do
			if not source.is_playing then
				source.play
			end
		end

	pause
		-- Routine qui fait arreter la musique.
		do
			if source.is_playing then
				source.pause
			end
		end

	mute
		-- Routine qui enlève le son de la musique.
		do
			if not muted then
				source.set_gain(0)
				muted:=True
			end
		end

	unmute
		-- Routine qui remet le son de la musique.
		do
			if muted then
				source.set_gain (0.2)
				muted:=False
			end
		end

	continue
		-- Routine qui fait en sorte qe la musique ne s'arrête jamais.
		do
			if source.is_pause then
				source.play
			end
		end


	add(a_filename:READABLE_STRING_GENERAL; a_nb_loop:INTEGER)
		-- Routine qui prend en argument le chemin d'accès d'une ou de plusieurs musiques et qui les joues.
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

feature -- Constant

	path:STRING_32

end
