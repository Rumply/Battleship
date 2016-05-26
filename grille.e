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
			dimension.width := a_width - (a_bordure/2).floor
			dimension.height := a_height - (a_bordure/2).floor
			dimension.bordure := a_bordure
			create masque.make (dimension.width, dimension.height)
			create masque_bombes.make (dimension.width, dimension.height)
			masque.enable_alpha_blending
			index := 1
			old_index := 2
			nombre_bateau:=0
			hover := false
			case_valide := true
			create black.make_rgb (0, 0, 0) -- Utilise la couleur noir (#000000)
			create listCase.make ((a_width/10).floor)
			create element.make ("eau.jpg") -- Crée l'élément "eau.jpg" pour l'arrière plan.
			create viseur.make_element ("vise.png") -- Crée l'élément "bois.jpg" pour indiquer l'emplacement visé dans la grille de jeu.
			initialize_grille
			fill_listCase

			create bombe.make(case_dimension)

			create boats.make(case_dimension.width, case_dimension.height)

		end

	initialize_grille
		-- Routine qui initialise les attributs de la grille.
		do
			position.x:=250
			position.y:=80
			selected_pos.x:=position.x
			selected_pos.y:=position.y
		end

	fill_listCase
			-- Routine qui fait en sorte que la grille soit séparée en 10 parties pour la longeure et 10 parties pour la hauteur
			-- ce qui résulte en une grille de 10x10 soit, 100 emplacements jouables.
		local
			l_index, l_Wreste, l_Hreste, l_x, l_y: INTEGER_32
			l_colonne,l_ranger:INTEGER
		do
			case_dimension.width := (dimension.width / 10).floor
			case_dimension.height := (dimension.height / 10).floor
			case_dimension.bordure := (dimension.bordure / 2).floor
			l_index := 1
			l_colonne:=0
			l_ranger:=0
			from
			until
				l_ranger >= 10
			loop
				from
					l_Wreste := dimension.width
				until
					l_colonne >= 10
				loop
					if l_index > 100 then
						io.new_line
						io.put_integer (l_index)
					end
					l_Wreste := l_Wreste - case_dimension.width
					add_case (l_index, l_x, l_y)
					l_x := l_x + case_dimension.width
					l_index := l_index + 1
					l_colonne := l_colonne + 1
				end
				l_colonne:=0
				l_x := 0
--				listcase.move (l_index)
				l_Hreste := l_Hreste - case_dimension.height
--				add_case (l_index, l_x, l_y)
				l_y := l_y + case_dimension.height
				l_ranger := l_ranger + 1
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
			elseif l_nombre_case_vertical > 1 then
				from
					l_index := 0
				until
					l_index >= l_nombre_case_vertical * 10
				loop
					position_used.extend (index + l_index)
					l_index := l_index + 10
				end
			else
				if indexs_used.has (index) then
					case_valide:=false
				else
					position_used.extend (index)
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

			l_temp := (a_mouse_x - position.x)
			l_colonne := l_temp.integer_quotient ((dimension.width / 10).floor)

			if not ((l_ranger > 9) or (l_colonne > 9)) then
				if not (l_ranger = old_ranger) then
					ranger := l_ranger
				end
				old_colonne := colonne

				if not (old_colonne = l_colonne) then
					colonne := l_colonne
				end
			end

			l_temp := ((ranger * 10) + colonne) + 1
			if not (l_temp = index) then
				old_index := index
				index := l_temp
			end
		end

	gestion_click
		local
			l_boat:MASQUE
			l_position_list:ARRAYED_LIST[INTEGER]
		do
			io.new_line
			io.put_integer (nombre_bateau)
			if nombre_bateau < 5 then
				l_boat:=boats.get_bateau (nombre_bateau)
				l_position_list := is_position_bateau_valide (l_boat.gamedimension.width, l_boat.gamedimension.height, True)
				if case_valide then
					boats.fill_bateau_list (nombre_bateau, l_position_list)
					draw_bateau (nombre_bateau)
					nombre_bateau := nombre_bateau + 1
				end
			elseif nombre_bateau >= 4 then
				l_position_list := is_position_bateau_valide (bombe.surface.gamedimension.width, bombe.surface.gamedimension.height, True)
				if case_valide then
					draw_explosion
				end
			end
		end

	draw_element_on(a_element_destination,a_element:MASQUE)
		do
			get_case_position

--			a_element_destination.draw_surface_with_scale (a_element,
--															a_element.position.x,
--															a_element.position.y,
--															a_element.gamedimension.width,
--															a_element.gamedimension.height)
--			a_element_destination.draw_sub_surface (a_element,
--													0,
--													0,
--													a_element.gamedimension.width,
--													a_element.gamedimension.height,
--													(colonne * case_dimension.width),
--													(ranger * case_dimension.height))
--			a_element_destination.draw_surface (a_element, 500, 0)
			io.new_line
			io.put_integer (a_element.height)
			a_element_destination.draw_sub_surface_with_scale (a_element,
																0,
																0,
																a_element.width,
																a_element.height,
																selected_pos.x,
																selected_pos.y,
																a_element.gamedimension.width,
																a_element.gamedimension.height)
		end

	draw_sub_element_on(a_element_destination,a_element:MASQUE)
		do
			get_case_position
			a_element_destination.draw_sub_surface_with_scale (a_element,
																a_element.in_image_pos.x,
																a_element.in_image_pos.y,
																a_element.filedimension.width,
																a_element.filedimension.height,
																selected_pos.x-position.x,
																selected_pos.y-position.y,
																a_element.gamedimension.width,
																a_element.gamedimension.height)
		end

	draw_bateau(id:INTEGER)
		local
			l_bateau:MASQUE
		do
			if id < 5 then
				l_bateau := boats.get_bateau (id)
				draw_sub_element_on (masque,l_bateau)
			end

		end

	draw_explosion
		-- Routine qui applique les bateaux un par un sur la grille. Le nombre de bateau maximum est de 5.
		do
			if nombre_bateau >= 5 then
				get_case_position
				draw_element_on (masque,bombe.surface)
			end
		end

	masque_bombes:MASQUE

	nombre_bateau:INTEGER

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

	boats:BATEAU

feature {NONE}

	bombe:VISEUR

end
