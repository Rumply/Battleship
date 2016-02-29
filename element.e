note
	description: "Summary description for {ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT

inherit
	GAME_SURFACE
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create()
		local
			l_background: IMG_IMAGE_FILE
			l_xPos,l_yPos: INTEGER
		do
			create l_background.make("./ressource/image/eau.jpg")
			if l_background.is_openable then
				l_background.open
				if l_background.is_open then
					make_from_image (l_background)
				else
					has_error := True
					make(1,1)
				end
			else
				has_error := True
				make(1,1)
			end
		end

end
