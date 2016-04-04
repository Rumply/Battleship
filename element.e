note
	description: "[
		Classe ou tout ce qui est dessiné est créé.La grille de jeu,les images et
		la boîte de discussion instantanée sont toutes implémantée dans le jeu grâce
		à la classe ELEMENT.
		]"
	author: "Guillaume Hamel-Gagné"
	date: "4 avril 2016"
	revision: "1.0"

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
			make_attributs
		end

	make_attributs
	do
		-- Crée les tuples contenant les `position', les `filedimension', les `gamedimension' et les `in_image_pos'.
		create {TUPLE[x,y:INTEGER]} position
		create {TUPLE[width,height:INTEGER]} filedimension
		create {TUPLE[width,height:INTEGER]} gamedimension
		create {TUPLE[x,y:INTEGER]} in_image_pos
		hover:=False
		selected:=False
	end

	load_background(a_filename:READABLE_STRING_GENERAL)
		local
			l_filePath:STRING_32 -- Prend un path `l_filePath' afin de trouver une image à placer en arrière plan.
			l_image:IMG_IMAGE_FILE -- Prend une image, `l_image' classée dans l'emplacemnet `l_filePath' donné précédemment.

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

feature {NONE} --Constants

	image_location: STRING_32
            -- `Result' is DIRECTORY constant named image_location.
        once
            Result := "./ressource/image/"
        end

end
