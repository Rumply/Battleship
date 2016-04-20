note
	description: "Summary description for {SPEAKER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPEAKER

create
	make

feature

	make
		do
			create environement_audio.make_environment
			create surface.make_element("speaker.png")
			initialize_speaker
		end

	initialize_speaker
		-- Routine qui impose les attributs du haut-parleur.
		do
			surface.position.x:=10
			surface.position.y:=10
			surface.in_image_pos.x:=0
			surface.in_image_pos.y:=0
			surface.filedimension.width:=surface.width.to_integer.quotient (2).truncated_to_integer
			surface.filedimension.height:=surface.height
			surface.gamedimension.width:=50
			surface.gamedimension.height:=50
		end

feature --Modification

	turnOn
		-- Routine qui dessine un haut-parleur ouvert.
		do
			surface.in_image_pos.x:=0
			surface.in_image_pos.y:=0
			environement_audio.unmute
		end

	turnOff
		-- Routine qui dessine un haut-parleur barré.
		do
			surface.in_image_pos.x:=250
			surface.in_image_pos.y:=0
			environement_audio.mute
		end

feature -- Access

	environement_audio:SOUND_ENGINE
	surface:MASQUE
end
