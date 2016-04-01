note
	description: "Summary description for {MASQUE}."
	author: "Guillaume Hamel Gagné"
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
		local
			l_pixel:GAME_PIXEL_FORMAT
		do
			create l_pixel
			l_pixel.set_bgra8888
			make_attributs
			old_make_for_pixel_format (l_pixel, a_width, a_height)
			enable_alpha_blending

		end

feature -- Access

	draw_surface_with_scale(a_element:ELEMENT;a_x,a_y,a_width,a_height:INTEGER_32)
		do
			draw_sub_surface_with_scale (a_element, 0, 0, a_element.width, a_element.height, a_x, a_y, a_width, a_height)
		end

	draw_empty_rect(a_color:GAME_COLOR;a_x,a_y,a_width,a_height,a_bordure:INTEGER_32)
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
