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

	make (a_width, a_height, a_bordure: INTEGER_32)
		require
			a_width_valide: a_width >= 0
			a_height_valide: a_height >= 0
			a_bordure_valide: a_bordure >= 0
		local
			black: GAME_COLOR
		do
			create {TUPLE [x, y: INTEGER]} position -- Crée un tuple qui garde en mémoire la position en x et en y sous une forme d'integer.
			create {TUPLE [x, y: INTEGER]} selected_pos -- Crée un tuple qui garde en mémoire la position sélectionnée en x et en y sous une forme d'integer.
			create {TUPLE [width, height, bordure: INTEGER]} dimension -- Crée un tuple, pour les dimensions, contenant la largeur, la hauteure et les bordures
				-- sous forme d'integer.
			create {TUPLE [width, height, bordure: INTEGER]} case_dimension -- Crée un tuple, pour la dimension de la case, contenant la largeur, la hauteure et
				-- les bordures sous une forme d'integer.
			create {ARRAYED_LIST [INTEGER]} indexs_used.make (0)
			dimension.width := a_width
			dimension.height := a_height
			dimension.bordure := a_bordure
			create masque.make_as_mask (dimension.width, dimension.height)
			masque.enable_alpha_blending
			index := 1
			old_index := 2
			hover := false
			case_valide := true
			create black.make_rgb (0, 0, 0) -- Utilise la couleur noir (#000000)
			create listCase.make (100)
			create element.make ("eau.jpg") -- Crée l'élément "eau.jpg" pour l'arrière plan.
			create viseur.make_element ("vise.png") -- Crée l'élément "bois.jpg" pour indiquer l'emplacement visé dans la grille de jeu.
			initialize_grille
			fill_listCase
		end

	initialize_grille
		-- Routine qui initialise les attributs de la grille.
		do
			position.x:=80
			position.y:=80
			dimension.width:=800
			dimension.height:=800
			dimension.bordure:=10
			selected_pos.x:=position.x
			selected_pos.y:=position.y
		end

	fill_listCase
			-- Routine qui fait en sorte que la grille soit séparée en 10 parties pour la longeure et 10 parties pour la hauteur
			-- ce qui résulte en une grille de 10x10 soit, 100 emplacements jouables.
		local
			l_index, l_Wreste, l_Hreste, l_x, l_y: INTEGER_32
		do
			case_dimension.width := (dimension.width / 10).floor
			case_dimension.height := (dimension.height / 10).floor
			case_dimension.bordure := (dimension.bordure / 2).floor
			l_index := 1
			from
				l_Hreste := dimension.height
			until
				l_Hreste <= 0
			loop
				from
					l_Wreste := dimension.width
				until
					l_Wreste <= 0
				loop
					l_Wreste := l_Wreste - case_dimension.width
					add_case (l_index, l_x, l_y)
					l_x := l_x + case_dimension.width
					l_index := l_index + 1
				end
				l_x := 0
				listcase.move (l_index)
				l_Hreste := l_Hreste - case_dimension.height
				add_case (l_index, l_x, l_y)
				l_y := l_y + case_dimension.height
				l_index := l_index + 1
			end
		end

	add_case (a_index, a_x, a_y: INTEGER)
		local
			l_case: CASE
		do
			l_case := create {CASE}.make (a_x, a_y, case_dimension.width, case_dimension.height, case_dimension.bordure)
			l_case.draw_surface (element, 0, 0)
			l_case.draw_empty_rect (create {GAME_COLOR}.make_rgb (0, 0, 0), 0, 0, case_dimension.width, case_dimension.height, case_dimension.bordure)
			listcase.extend (l_case)
			masque.draw_surface (l_case, a_x, a_y)
		end

feature --Access

	is_position_bateau_valide (a_bateau_width, a_bateau_height: INTEGER; canAdd: BOOLEAN): ARRAYED_LIST [INTEGER]
		local
			l_nombre_case_horizontal, l_nombre_case_vertical: INTEGER
			l_index: INTEGER
			position_used: ARRAYED_LIST [INTEGER]
		do
			l_nombre_case_horizontal := (a_bateau_width / case_dimension.width).floor
			l_nombre_case_vertical := (a_bateau_height / case_dimension.height).floor
			create position_used.make (0)
			case_valide := true
			if l_nombre_case_horizontal > 1 then
				from
					l_index := 0
				until
					l_index >= l_nombre_case_horizontal
				loop
					if (indexs_used.count >= 0) then
						if (indexs_used.has (index + l_index) or ((colonne + l_nombre_case_horizontal) > 10)) then
							case_valide := false
						else
							position_used.extend (index + l_index)
						end
					end
					l_index := l_index + 1
				end
			end
			if l_nombre_case_vertical > 1 then
				from
					l_index := 0
				until
					l_index >= l_nombre_case_vertical * 10
				loop
					position_used.extend (index + l_index)
					l_index := l_index + 10
				end
			end
			if case_valide then
				if canAdd then
					indexs_used.append (position_used)
				end
			end
			result:=position_used
		end

	get_list_position (a_width, a_height: INTEGER): ARRAYED_LIST [INTEGER]
		local
			l_nombre_case_horizontal, l_nombre_case_vertical: INTEGER
			position_used: ARRAYED_LIST [INTEGER]
		do
			l_nombre_case_horizontal := (a_width / case_dimension.width).floor
			l_nombre_case_vertical := (a_height / case_dimension.height).floor
			create position_used.make (0)
			if l_nombre_case_horizontal > 1 then
				create position_used.make (l_nombre_case_horizontal)
				from
				until
					index >= index + l_nombre_case_horizontal
				loop
					io.put_string (index.out)
					position_used.extend (index)
					index := index + 1
				end
			end
			if l_nombre_case_vertical > 1 then
				create position_used.make (l_nombre_case_vertical)
				from
				until
					index >= index + (l_nombre_case_vertical * 10)
				loop
					io.put_string (index.out)
					position_used.extend (index)
					index := index + 10
				end
			end
			result := position_used
		end

	get_case_position
			-- Routine qui update les propriétés du tuple `selected_pos'.
		do
			selected_pos.x := (position.x + (colonne * case_dimension.width))
			selected_pos.y := (position.y + (ranger * case_dimension.height))
		end

	is_on (a_mouse_x, a_mouse_y: INTEGER)
			-- Routine qui garde en mémoire l'emplacement du curseur afin de faire surligner la case ou le bouton sur lequel il est en ce moment.
		do
			if a_mouse_x > position.x and a_mouse_x < (position.x + dimension.width) then
				if a_mouse_y > position.y and a_mouse_y < (position.y + dimension.height) then
					hover := True
				else
					hover := False
				end
			else
				hover := False
			end
		end

	get_index_from_mousePos (a_mouse_x, a_mouse_y: INTEGER_32)
			-- Routine qui compare l'emplacement en x et en y du curseur et des positions antérieurement choisies.
		local
			l_temp: INTEGER_32
			l_colonne, l_ranger: INTEGER_32
		do
			old_ranger := ranger
			l_temp := (a_mouse_y - position.y)
			l_ranger := (l_temp.integer_quotient ((dimension.height / 10).floor))
			if not (l_ranger = old_ranger) then
				ranger := l_ranger
			end
			old_colonne := colonne
			l_temp := (a_mouse_x - position.x)
			l_colonne := l_temp.integer_quotient ((dimension.width / 10).floor)
			if not (old_colonne = l_colonne) then
				colonne := l_colonne
			end
			l_temp := ((ranger * 10) + colonne) + 1
			if not (l_temp = index) then
				old_index := index
				index := l_temp
			end
		end

	old_colonne, old_ranger: INTEGER_32

	colonne, ranger: INTEGER_32

	index, old_index: INTEGER_32

	indexs_used: ARRAYED_LIST [INTEGER]

	hover, case_valide: BOOLEAN

	masque: MASQUE

	viseur: MASQUE

	element: ELEMENT

	dimension: TUPLE [width, height, bordure: INTEGER_32]

	case_dimension: TUPLE [width, height, bordure: INTEGER_32]

	selected_pos: TUPLE [x, y: INTEGER]

	position: TUPLE [x, y: INTEGER]

	listCase: ARRAYED_LIST [CASE]
			-- future -- boolMap:ARRAYED_LIST[BOOLEAN]

end
