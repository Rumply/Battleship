note
	description: "[
			Classe où est-ce que le tableau de jeu est créé. 10x10 est sa dimension par 
			défaut. La classe GRILLE hérite de la classe MASQUE afin de pouvoir garder
			en mémoire l'emplacement des bateaux à leur application sur la grille.
			]"
	author: "Guillaume Hamel-Gagné"
	date: "28 mars 2016"
	revision: "1.0"

class
	GRILLE

create
	make

feature {NONE}

	make(a_width,a_height,a_bordure:INTEGER_32)
		local
			black:GAME_COLOR
		do
			create {TUPLE[x,y:INTEGER]} position -- Crée un tuple qui garde en mémoire la position en x et en y sous une forme d'integer.
			create {TUPLE[x,y:INTEGER]} selected_pos -- Crée un tuple qui garde en mémoire la position sélectionnée en x et en y sous une forme d'integer.
			create {TUPLE[width,height,bordure:INTEGER]} dimension -- Crée un tuple, pour les dimensions, contenant la largeur, la hauteure et les bordures
																   -- sous forme d'integer.
			create {TUPLE[width,height,bordure:INTEGER]} case_dimension -- Crée un tuple, pour la dimension de la case, contenant la largeur, la hauteure et
																		-- les bordures sous une forme d'integer.
			dimension.width:=a_width
			dimension.height:=a_height
			dimension.bordure:=a_bordure
			create masque.make_as_mask (dimension.width, dimension.height)
			masque.enable_alpha_blending

			index:=1
			old_index:=2
			hover:=false
			create black.make_rgb (0,0,0) -- Utilise la couleur noir (#000000)
			create listCase.make (100)
			create element.make ("eau.jpg") -- Crée l'élément "eau.jpg" pour l'arrière plan.
			create viseur.make ("bois.jpg") -- Crée l'élément "bois.jpg" pour indiquer l'emplacement visé dans la grille de jeu.
			fill_listCase
		end

		fill_listCase
				-- Routine qui fait en sorte que la grille soit séparée en 10 parties pour la longeure et 10 parties pour la hauteur
				-- ce qui résulte en une grille de 10x10 soit, 100 emplacements jouables.
			local
			l_index,l_Wreste,l_Hreste,l_x,l_y:INTEGER_32
			l_double:REAL_64
			l_case:CASE
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
					l_case:=listcase[l_index]
					l_case.draw_surface (element, 0, 0)
					l_case.draw_empty_rect (create {GAME_COLOR}.make_rgb (0,0,0), 0,0, case_dimension.width, case_dimension.height, case_dimension.bordure)
					masque.draw_surface (l_case, l_x, l_y)
					l_x:= l_x + case_dimension.width
					l_index:= l_index + 1
				end
				l_x:=0
				listcase.move (l_index)
				l_Hreste:= l_Hreste - case_dimension.height
				listcase.extend (create {CASE}.make(l_x, l_y, case_dimension.width, case_dimension.height, case_dimension.bordure))
				l_case:=listcase[l_index]
				l_case.draw_surface (element, 0, 0)
				l_case.draw_empty_rect (create {GAME_COLOR}.make_rgb (0,0,0), 0,0, case_dimension.width, case_dimension.height, case_dimension.bordure)
				masque.draw_surface (l_case, l_case.position.x, l_case.position.y)
				l_y:= l_y + case_dimension.height
				l_index:= l_index + 1
			end
		end


feature --Access

	get_case_position
		-- Routine qui prend en argument quelle est la position des x et des y dans la grille.
		do
			selected_pos.x:=(position.x+(colonne*case_dimension.width))
			selected_pos.y:=(position.y+(ranger*case_dimension.height))
		end

	is_on(a_mouse_x,a_mouse_y:INTEGER)
		-- Routine qui garde en mémoire l'emplacement du curseur afin de faire surligner la case ou le bouton sur lequel il est en ce moment.
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
		-- Routine qui compare l'emplacement en x et en y du curseur et des positions antérieurement choisies.
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
