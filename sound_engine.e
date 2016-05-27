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
	-- Routine qui initialise les sons.
		do
			path:="./ressource/son/"
			create environment
			audio_library.sources_add -- Add a sound source in the audio context.
			source:=audio_library.last_source_added
			source.gain:=0.2
			muted:=False

			create audio_files.make_caseless (5)
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


	add(a_filename:READABLE_STRING_GENERAL)
		-- Routine qui prend en argument le chemin d'accès d'une ou de plusieurs musiques et qui les joues.
		local
			l_filePath:STRING_32
			l_sound:AUDIO_SOUND_FILE
		do
			l_filePath:=path
			l_filePath.append_string_general (a_filename)
			create l_sound.make (l_filePath)
			audio_files.extend (l_sound, a_filename)
		end

	start(a_name:STRING; a_nb_loop:INTEGER)
	-- Routine qui fait en sorte que la musique choisie puisse être jouée un nombre prédéfini de fois.
		do
			if not source.is_playing then
				if attached audio_files.at (a_name) as l_sound then
					open(l_sound, a_nb_loop)
				else
					add(a_name)
					if attached audio_files.at (a_name) as l_sound then
						open(l_sound, a_nb_loop)
					else
						has_error:=True
					end
				end
			end
		end

feature

	open(file:AUDIO_SOUND_FILE; a_nb_loop:INTEGER)
	-- Routine qui lis le bon type de fichier audio pendant un nombre prédéfini de fois.
		do
			if file.is_openable then
				file.open
				if file.is_open then
					source.queue_sound_loop (file, a_nb_loop)
				else
					has_error := True
				end
			else
				has_error := True
			end
		end


	muted:BOOLEAN -- Change le BOOL si l'utilisateur ne veut plus entendre le son.

	environment:EXECUTION_ENVIRONMENT --

	source:AUDIO_SOURCE -- Applique les instructions inscrites dans {AUDIO_SOURCE} afin que les éléments audio soient entendu.

	has_error:BOOLEAN -- Envoit un BOOL si une erreur survient.

	audio_files:STRING_TABLE[AUDIO_SOUND_FILE]

feature -- Constant

	path:STRING_32

end
