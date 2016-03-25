note
	description: "Summary description for {GRILLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRILLE

create
	make

feature {NONE}

	make(a_width,a_height,a_bordure:INTEGER_32)
		local
			black:GAME_COLOR
		do
			create {TUPLE[x,y:INTEGER]} position
			create {TUPLE[x,y:INTEGER]} selected_pos
			create {TUPLE[width,height,bordure:INTEGER]} dimension
			create {TUPLE[width,height,bordure:INTEGER]} case_dimension
			dimension.width:=a_width
			dimension.height:=a_height
			dimension.bordure:=a_bordure
			create masque.make_as_mask (dimension.width, dimension.height)
			masque.enable_alpha_blending

			index:=1
			old_index:=2
			hover:=false
			create black.make_rgb (0,0,0)
			create listCase.make (100)
			create element.make ("eau.jpg")
			create viseur.make ("bois.jpg")
			fill_listCase
		end

		fill_listCase
			local
			l_index,l_Wreste,l_Hreste,l_x,l_y:INTEGER_32
			l_double:REAL_64
		do
			l_double:=dimension.width/10
			case_dimension.width:=l_double.floor
			l_double:=dimension.height/10
			case_dimension.height:=l_double.floor

			l_double:=dimension.bordure/2
			case_dimension.bordure:=l_double.floor
			l_index:=1
			l_x:=0
			l_y:=0

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
					l_Wreste:= l_Wreste - case_dimension.width
					listcase.extend (create {CASE}.make(l_x, l_y, case_dimension.width, case_dimension.height, case_dimension.bordure))
					listcase[l_index].draw_surface (element, 0, 0)
					listcase[l_index].draw_empty_rect (create {GAME_COLOR}.make_rgb (0,0,0), 0,0, case_dimension.width, case_dimension.height, case_dimension.bordure)
					masque.draw_surface (listcase[l_index], l_x, l_y)
					l_x:= l_x + case_dimension.width
					l_index:= l_index + 1
				end
				l_x:=0
				listcase.move (l_index)
				l_Hreste:= l_Hreste - case_dimension.height
				listcase.extend (create {CASE}.make(l_x, l_y, case_dimension.width, case_dimension.height, case_dimension.bordure))
				listcase[l_index].draw_surface (element, 0, 0)
				listcase[l_index].draw_empty_rect (create {GAME_COLOR}.make_rgb (0,0,0), 0,0, case_dimension.width, case_dimension.height, case_dimension.bordure)
				masque.draw_surface (listcase[l_index], l_x, l_y)
				l_y:= l_y + case_dimension.height
				l_index:= l_index + 1
			end
		end


feature --Access

	get_case_position
		do
			selected_pos.x:=(position.x+(colonne*case_dimension.width))
			selected_pos.y:=(position.y+(ranger*case_dimension.height))
		end

	is_on(a_mouse_x,a_mouse_y:INTEGER)
		do
			if a_mouse_x>position.x and a_mouse_x<(position.x+dimension.width) then
				if a_mouse_y>position.y and a_mouse_y<(position.y+dimension.height) then
					hover:=True
				else
					hover:=False
				end
			else
				hover:=False
			end
		end

	get_index_from_mousePos(a_mouse_x,a_mouse_y:INTEGER_32)
		local
			l_temp:INTEGER_32
		do
			l_temp:=(a_mouse_y-position.y)
			if not (l_temp=old_ranger) then
				ranger:=(l_temp.integer_quotient ((dimension.height/10).floor))
			end
			l_temp:=(a_mouse_x-position.x)
			if not (l_temp=old_colonne) then
				colonne:=(l_temp.integer_quotient ((dimension.width/10).floor))
			end
			l_temp:=((ranger*10)+colonne)+1
			if not (l_temp=index) then
				old_index:=0
				old_index:= old_index + index
				index:=l_temp
			end
		end

	old_colonne,old_ranger:INTEGER_32
	colonne,ranger:INTEGER_32
	index, old_index:INTEGER_32
	hover:BOOLEAN
	masque:MASQUE
	element,viseur:ELEMENT
	dimension:TUPLE[width,height,bordure:INTEGER_32]
	case_dimension:TUPLE[width,height,bordure:INTEGER_32]
	selected_pos:TUPLE[x,y:INTEGER]
	position:TUPLE[x,y:INTEGER]

	listCase:ARRAYED_LIST[CASE]
	-- future -- boolMap:ARRAYED_LIST[BOOLEAN]
end
