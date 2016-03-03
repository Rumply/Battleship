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
		do
			path:="./ressource/image/"

			load_background(a_filename)
			create {TUPLE[x,y:INTEGER]} position.default_create
			create {TUPLE[width,height:INTEGER]} filedimension.default_create
			create {TUPLE[width,height:INTEGER]} gamedimension.default_create
			create {TUPLE[x,y:INTEGER]} in_image_pos.default_create
			hover:=False
		end

		load_background(a_filename:READABLE_STRING_GENERAL)
		local
			l_filePath:STRING_32
			l_image:IMG_IMAGE_FILE

		do
			l_filePath:= path
			l_filePath.append_string_general (a_filename)
			create l_image.make(l_filePath)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					make_from_image (l_image)
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

	set_sub_image(a_x,a_y:INTEGER)
		do
			in_image_pos.x:= a_x
			in_image_pos.y:= a_y
		end


	in_image_pos:TUPLE[x,y:INTEGER]

	position:TUPLE[x,y:INTEGER]

	fileDimension:TUPLE[width,height:INTEGER]

	gameDimension:TUPLE[width,height:INTEGER]

feature --Constants
	path:STRING_32

end
