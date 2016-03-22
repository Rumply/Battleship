note
	description: "Summary description for {GRILLE_2}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRILLE_2

create
	make

feature {NONE}

	make(a_width,a_height,a_bordure:INTEGER_32)
		local
			black:GAME_COLOR
		do
			create {TUPLE[x,y:INTEGER]} position
			create {TUPLE[width,height,bordure:INTEGER]} dimension
			dimension.width:=a_width
			dimension.height:=a_height
			dimension.bordure:=a_bordure
			create masque.make_as_mask (dimension.width, dimension.height)
			masque.enable_alpha_blending

			create black.make_rgb (0,0,0)
			load_grille(black)
		end

		load_grille(a_color:GAME_COLOR)
			local
				l_width,l_height,l_Wreste,l_Hreste,l_x,l_y,l_bordure:INTEGER
				l_double:REAL_64
			do
				l_double:=dimension.width/10
				l_width:=l_double.floor
				l_double:=dimension.height/10
				l_height:=l_double.floor

				l_double:=dimension.bordure/2
				l_bordure:=l_double.floor
				l_x:=0
				l_y:=0

				masque.draw_empty_rect (a_color, l_x, l_y, dimension.width, dimension.height, dimension.bordure)

				from
					l_Hreste:=dimension.height
				until
					l_Hreste <= 0
				loop
					from
						l_Wreste:=dimension.width
					until
						l_Wreste <= 0
					loop
						l_Wreste:= l_Wreste - l_width
						masque.draw_empty_rect (a_color, l_x, l_y, l_width, l_height, l_bordure)
						l_x:= l_x + l_width
					end
					l_x:=0
					l_Hreste:= l_Hreste - l_height
					masque.draw_empty_rect (a_color, l_x, l_y, l_width, l_height, l_bordure)
					l_y:= l_y + l_height
				end
			end

feature --Access

	masque:MASQUE
	dimension:TUPLE[width,height,bordure:INTEGER_32]
	position:TUPLE[x,y:INTEGER]
end
