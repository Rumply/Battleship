note
	description: "Summary description for {MASQUE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MASQUE

inherit
	GAME_SURFACE

create
	make

feature -- Access

	draw_empty_rect(a_color:GAME_COLOR;a_x,a_y,a_width,a_height,a_bordure:INTEGER_32)
		local
			l_x,l_y:INTEGER
		do
			l_x:=((a_x+a_width)-a_bordure)
			l_y:=((a_y+a_height)-a_bordure)
			draw_rectangle (a_color, a_x, a_y, a_bordure, a_height)
--			draw_rectangle (a_color, a_x, a_y, a_width, a_bordure)
--			draw_rectangle (a_color, a_x, l_y, a_width, a_bordure)
--			draw_rectangle (a_color, l_x, a_y, a_width, a_height)
		end

end
