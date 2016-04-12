note
	description: "[
				Classe qui dessine un masque de l'image en cours (de la grille) afin de
				garder en mémoire l'emplacement de la grille et des bateaux lorsque ceux-ci
				seront placé.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "$Date$"
	revision: "$Revision$"

class
	MASQUE

inherit
	ELEMENT
		rename
			make as make_element,
			make_for_pixel_format as old_make_for_pixel_format
		end

create
	make_element,
	make_as_mask

feature {NONE}

	make_as_mask (a_width, a_height: INTEGER_32)
		-- Routine qui dessine des masques.
		require
			a_width_valide: a_width >= 0
			a_height_valide: a_height >= 0
		local
			l_pixel:GAME_PIXEL_FORMAT
		do
			create l_pixel
			l_pixel.set_bgra8888
			make_attributs
			old_make_for_pixel_format (l_pixel, a_width, a_height)
			enable_alpha_blending
			gamedimension.width:=a_width;
			gamedimension.height:=a_height
		end

feature -- Access

	draw_background_with_tuile(a_tuile:MASQUE)
		-- Routine qui fait en sorte que la grille soit séparée en 10 parties pour la longeure et 10 parties pour la hauteur
		-- ce qui résulte en une grille de 10x10 soit, 100 emplacements jouables.
		local
			l_Wreste,l_Hreste,l_x,l_y:INTEGER_32
		do
			l_x:=0
			l_y:=0

			from
				l_Hreste:=gamedimension.height
			until
				l_Hreste <= 0
			loop
				from
					l_Wreste:=gamedimension.width
				until
					l_Wreste <= 0
				loop
					l_Wreste:= l_Wreste - a_tuile.width
					draw_surface(a_tuile, l_x, l_y)
					l_x:= l_x + a_tuile.width
				end
				l_x:=0
				l_Hreste:= l_Hreste - a_tuile.height
				draw_surface(a_tuile, l_x, l_y)
				l_y:= l_y + a_tuile.height
			end
		end

	draw_surface_with_scale(a_element:ELEMENT;a_x,a_y,a_width,a_height:INTEGER_32)
		-- Routine qui dessine un masque de la surface jouée en ce moment.
		do
			draw_sub_surface_with_scale (a_element, 0, 0, a_element.width, a_element.height, a_x, a_y, a_width, a_height)
		end

	draw_empty_rect(a_color:GAME_COLOR;a_x,a_y,a_width,a_height,a_bordure:INTEGER_32)
		-- Routine qui dessine un rectangle vide.
		local
			l_x,l_y:INTEGER_32
		do
			l_x:=((a_x+a_width)-a_bordure)
			l_y:=((a_y+a_height)-a_bordure)
			draw_rectangle (a_color, a_x, a_y, a_bordure, a_height)
			draw_rectangle (a_color, a_x, a_y, a_width, a_bordure)
			draw_rectangle (a_color, a_x, l_y, a_width, a_bordure)
			draw_rectangle (a_color, l_x, a_y, a_bordure, a_height)
		end

	draw_rect_with_tile(a_filename: READABLE_STRING_GENERAL; a_width, a_height, a_bordure:INTEGER_32)
		-- Routine qui dessine un rectangle vide avec des tuiles.
		local
			l_element:ELEMENT
			l_x,l_y:INTEGER_32
		do
			create l_element.make (a_filename)
			l_x:=(a_width-a_bordure)
			l_y:=(a_height-a_bordure)
			draw_surface_with_scale (l_element, 0, 0, a_bordure, a_height)
			draw_surface_with_scale (l_element, 0, 0, a_width, a_bordure)
			draw_surface_with_scale (l_element, 0, l_y, a_width, a_bordure)
			draw_surface_with_scale (l_element, l_x, 0, a_bordure, a_height)
		end

	bordure:INTEGER_32

end
