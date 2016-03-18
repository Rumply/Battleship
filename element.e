note
	description: "Summary description for {ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT

inherit
	GAME_SURFACE
		rename
			make as make_game_surface
		end

create
	make

feature {NONE} -- Initialization

	make(a_filename:READABLE_STRING_GENERAL)
		do
			load_background(a_filename)
			create {TUPLE[x,y:INTEGER]} position.default_create
			create {TUPLE[width,height:INTEGER]} filedimension.default_create
			create {TUPLE[width,height:INTEGER]} gamedimension.default_create
			create {TUPLE[x,y:INTEGER]} in_image_pos.default_create
			hover:=False
			selected:=False
		end

	load_background(a_filename:READABLE_STRING_GENERAL)
		local
			l_filePath:STRING_32
			l_image:IMG_IMAGE_FILE

		do
			l_filePath:=""
			l_filePath.append (image_location)
			l_filePath.append_string_general (a_filename)
			create l_image.make(l_filePath)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					make_from_image (l_image)
				else
					has_error := True
					make_game_surface(1,1)
				end

			else
				has_error := True
				make_game_surface(1,1)
			end
		end

feature -- Access



	is_on(a_mouse_x,a_mouse_y:INTEGER)
		do
			if a_mouse_x>position.x and a_mouse_x<(position.x+gamedimension.width) then
				if a_mouse_y>position.y and a_mouse_y<(position.y+gamedimension.height) then
					hover:=True
				else
					hover:=False
				end
			else
				hover:=False
			end
		end

	hover:BOOLEAN

	in_image_pos:TUPLE[x,y:INTEGER]

	position:TUPLE[x,y:INTEGER]

	fileDimension:TUPLE[width,height:INTEGER]

	selected:BOOLEAN assign set_selected
			-- `Current' is selected

	set_selected(a_selected:BOOLEAN)
			-- Assign the value of `selected' with `a_selected'
		do
			selected := a_selected
		ensure
			Is_Assign: selected = a_selected
		end

	gameDimension:TUPLE[width,height:INTEGER]

feature --Constants

	image_location: STRING_32
            -- `Result' is DIRECTORY constant named image_location.
        once
            Result := "./ressource/image/"
        end

end
