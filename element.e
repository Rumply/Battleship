note
	description: "Summary description for {ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT

inherit
	GAME_SURFACE

create
	make_surface

feature {NONE} -- Initialization

	make_surface(a_filename:READABLE_STRING_GENERAL)
		local
			l_path:STRING_32
		do
			l_path:="./ressource/image/"
			l_path.append_string_general (a_filename)
			create background.make(l_path)
			if background.is_openable then
				background.open
				if background.is_open then
					make_from_image (background)
				else
					has_error := True
					make(1,1)
				end
			else
				has_error := True
				make(1,1)
			end
		end

feature -- Access

	background:IMG_IMAGE_FILE

end
