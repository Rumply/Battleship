note
	description: "[
				Classe qui fait en sorte que la grille de jeu soit réactive aux mouvements de
				l'utilisateur. La Classe crée aussi l'arrière plan, le haut-parleur, les limites
				de la boîte de dialogue et les limites de la boîte de discussion instantanée.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "4 avril 2016"
	revision: "1.0"

class
	INGAME_SCREEN

inherit
	CONSOLE_SHARED

create
	make

feature {NONE}

	make(a_window:GAME_WINDOW_SURFACED; a_speaker:SPEAKER)
	require
		a_window_is_open: a_window.surface.is_open
	local
		l_double:REAL_64
		l_bordure_size:INTEGER
	do
		window:=a_window
		if attached console as l_console then
			l_console.clear
		end

		l_double:=(window.width/3)
		--window.start_text_input	-- On some OS, it show the onscreen keyboard
		l_bordure_size:=((l_double.floor)/60).floor

		create grille_joueur1.make ((l_double).floor, (l_double).floor, l_bordure_size)
		create grille_joueur2.make ((l_double).floor, (l_double).floor, l_bordure_size)
		grille_joueur2.position.x:=grille_joueur1.dimension.width + (((l_double).floor/2).floor)
		teste:=false
		create bordure1.make ((l_double).floor+l_bordure_size, (l_double).floor+l_bordure_size)
		bordure1.draw_rect_with_tile ("bois.jpg", bordure1.gamedimension.width, bordure1.gamedimension.height, l_bordure_size)

		create background.make (window.width, window.height)
		create background_tuile.make_element ("eau.jpg")

		create dialogue.make (window)

		speaker:=a_speaker

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		current_index:=1
		color:=black

		mouse_x:= 0
		mouse_y:= 0

		initialize_bordure
		load_case_element
		initialize_bateau

		setup_object
	end

	load_case_element
		-- Routine qui fait en sorte que la texture de bois soit autour du cadre (grille).
		-- Routine qui crée un pointeur à la position du curseur.
		do
			create pointer.make(grille_joueur1.case_dimension)
		end

	set_as_default_pointer
		do
			pointer.surface.in_image_pos.x:=0
			pointer.surface.in_image_pos.y:=0
			pointer.surface.filedimension.width:=100
			pointer.surface.filedimension.height:=100
			pointer.surface.gamedimension.width:=grille_joueur1.case_dimension.width
			pointer.surface.gamedimension.height:=grille_joueur1.case_dimension.height
			pointer.surface.position.x:=0
			pointer.surface.position.y:=0
		end

	initialize_bateau
		do
			create boat.make(grille_joueur1.case_dimension.width, grille_joueur1.case_dimension.height)
			id_bateau:=0
		end

	initialize_bordure
		-- Routine qui initialise les bordures de la grille.
		do
			bordure1.position.x:=grille_joueur1.position.x - grille_joueur1.dimension.bordure
			bordure1.position.y:=grille_joueur1.position.y - grille_joueur1.dimension.bordure
		end

	setup_border
		-- Routine qui dessine la grille, les bordures et les bordures de la discussion instantanée.
		do
			background.draw_surface (grille_joueur1.masque, grille_joueur1.position.x,grille_joueur1.position.y)
			background.draw_surface (grille_joueur2.masque, grille_joueur2.position.x,grille_joueur2.position.y)
			background.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			background.draw_surface (dialogue, dialogue.position.x, dialogue.position.y)
		end

	set_pointer
		do
			if (id_bateau=5) then
				pointer.set_as_default_pointer
			end

		end

	setup_object
			-- Event that is launch at each iteration.
		do
			fill_background
			setup_border

			window.surface.draw_surface (background, 0,0)

			draw(speaker.surface)
			-- Update modification in the screen
			window.update
		end

feature -- Access

	cycle
		local
			position_bateau_temp:ARRAYED_LIST[INTEGER]
		do
			if click then
				if speaker.surface.hover then
					if not speaker.environement_audio.muted then
						speaker_off
					elseif speaker.environement_audio.muted then
						speaker_on
					end
				elseif grille_joueur1.hover then
					grille_joueur1.get_index_from_mousePos(mouse_x,mouse_y)
					set_pointer
					boat.set_bateau(id_bateau)
					if (id_bateau < 5) then
						position_bateau_temp:= ((grille_joueur1.is_position_bateau_valide (boat.image_bateau.gamedimension.width, boat.image_bateau.gamedimension.height, true)))
						if grille_joueur1.case_valide then
							boat.fill_bateau_list(id_bateau,position_bateau_temp)
							draw_case (mouse_x, mouse_y)
							id_bateau:= id_bateau + 1
						end
					end
				end
				if grille_joueur2.hover then
					grille_joueur2.get_index_from_mousePos(mouse_x,mouse_y)
					if (id_bateau >= 5) then
						position_bateau_temp:= ((grille_joueur2.is_position_bateau_valide (pointer.surface.gamedimension.width, pointer.surface.gamedimension.height, true)))
						if grille_joueur2.case_valide then
							draw_explosion (mouse_x, mouse_y)
						end
					end
				end
				io.put_integer (id_bateau)
				io.new_line
				if not grille_joueur1.hover then
					window.surface.draw_surface (grille_joueur1.masque, grille_joueur1.position.x, grille_joueur1.position.y)
				end
				if not grille_joueur2.hover then
					window.surface.draw_surface (grille_joueur2.masque, grille_joueur2.position.x, grille_joueur2.position.y)
				end
				if dialogue.hover then
					window.start_text_input	-- On some OS, it show the onscreen keyboard
				elseif not dialogue.hover then
					window.stop_text_input
				end
				click:=false
			end
		end

	left_mouse_click(a_x,a_y:INTEGER;a_click:BOOLEAN)
		-- Routine qui gère les éléments et les actions faites par le curseur.
		-- Routine qui applique les bateaux un par un lorsqu'un click est fait dans la grille, jusqu'à un maximum de 5 bateaux dans la grille.
		do
			mouse_x:= a_x
			mouse_y:= a_y
			speaker.surface.is_on (a_x, a_y)
			grille_joueur1.is_on (a_x, a_y)
			grille_joueur2.is_on (a_x, a_y)
			dialogue.is_on (a_x, a_y)
			click:= a_click
			if click then
				cycle
			end
		end

	write_box(a_text_surface:TEXT_SURFACE_BLENDED)
		do
			window.surface.draw_surface (dialogue, dialogue.position.x, dialogue.position.y)
			window.surface.draw_surface (a_text_surface, dialogue.position.x + dialogue.bordure + 30, dialogue.position.y - dialogue.bordure + dialogue.height - 50)
		end

	right_mouse_click(a_x,a_y:INTEGER)
		do

		end

	fill_background
		-- Routine qui remplit l'arrière plan avec une image prédéfinie.
		do
			background.draw_background_with_tuile (background_tuile)
			window.surface.draw_surface(background, 0, 0)
		end

	draw_case(a_x,a_y:INTEGER)
		-- Routine qui applique les bateaux un par un sur la grille. Le nombre de bateau maximum est de 5.
		local
			l_temp:INTEGER_32
			l_bateau:MASQUE
		do
			if (id_bateau < 6) then
				l_bateau:=boat.get_bateau(id_bateau)
				l_temp:=l_temp + grille_joueur1.index
				grille_joueur1.get_index_from_mousepos (a_x, a_y)
				grille_joueur1.get_case_position
				grille_joueur1.masque.draw_sub_surface_with_scale (l_bateau, l_bateau.in_image_pos.x,l_bateau.in_image_pos.y, l_bateau.filedimension.width, l_bateau.filedimension.height, grille_joueur1.selected_pos.x-grille_joueur1.position.x, grille_joueur1.selected_pos.y-grille_joueur1.position.y, l_bateau.gamedimension.width, l_bateau.gamedimension.height)
				window.surface.draw_surface (grille_joueur1.masque, grille_joueur1.position.x, grille_joueur1.position.y)
				window.surface.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			end
		end

	draw_explosion(a_x,a_y:INTEGER)
		-- Routine qui applique les bateaux un par un sur la grille. Le nombre de bateau maximum est de 5.
		do
			grille_joueur2.get_case_position
			grille_joueur2.masque.draw_sub_surface_with_scale (pointer.surface, pointer.surface.in_image_pos.x,pointer.surface.in_image_pos.y, pointer.surface.filedimension.width, pointer.surface.filedimension.height, grille_joueur2.selected_pos.x-grille_joueur2.position.x, grille_joueur2.selected_pos.y-grille_joueur2.position.y, pointer.surface.gamedimension.width, pointer.surface.gamedimension.height)
			window.surface.draw_surface (grille_joueur2.masque, grille_joueur2.position.x, grille_joueur2.position.y)
			window.surface.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)

			window.surface.draw_sub_surface_with_scale (pointer.surface, pointer.surface.in_image_pos.x,pointer.surface.in_image_pos.y, pointer.surface.filedimension.width, pointer.surface.filedimension.height, grille_joueur2.selected_pos.x, grille_joueur2.selected_pos.y, pointer.surface.gamedimension.width, pointer.surface.gamedimension.height)
		end

	draw_pointer(a_x,a_y:INTEGER_32)
		-- Routine qui dessine un élément temporaire à l'emplacement du curseur sur la grille.
		local
			l_temp:INTEGER_32
		do
			l_temp:=0
			l_temp:=l_temp + grille_joueur1.index
			grille_joueur1.get_index_from_mousepos (a_x, a_y)

			if not (grille_joueur1.old_index = grille_joueur1.index) then
				grille_joueur1.get_case_position
				window.surface.draw_surface (grille_joueur1.masque, grille_joueur1.position.x, grille_joueur1.position.y)
				window.surface.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
				window.surface.draw_sub_surface_with_scale (pointer.surface, pointer.surface.in_image_pos.x,pointer.surface.in_image_pos.y, pointer.surface.filedimension.width, pointer.surface.filedimension.height, grille_joueur1.selected_pos.x, grille_joueur1.selected_pos.y, pointer.surface.gamedimension.width, pointer.surface.gamedimension.height)
			end
		end

	draw(a_element:ELEMENT)
		-- Routine qui dessine à l'écran les éléments de a_element.
		do
			window.surface.draw_sub_surface_with_scale (a_element,
														a_element.in_image_pos.x,
														a_element.in_image_pos.y,
														a_element.filedimension.width,
														a_element.filedimension.height,
														a_element.position.x,
														a_element.position.y,
														a_element.gamedimension.width,
														a_element.gamedimension.height)
		end

	speaker_on
		-- Routine qui dessine un haut-parleur ouvert.
		do
			speaker.turnon
			draw(speaker.surface)

		end

	speaker_off
		-- Routine qui dessine un haut-parleur barré.
		do
			speaker.turnOff
			draw(speaker.surface)
		end

	dialogue:DIALOGUE
	click:BOOLEAN
	mouse_x,mouse_y:INTEGER
	boat:BATEAU
	pointer:VISEUR
	speaker:SPEAKER
	id_bateau:INTEGER_32
	teste:BOOLEAN
	background_tuile,background:MASQUE
	bordure1:MASQUE
	grille_joueur1:GRILLE
	grille_joueur2:GRILLE

	current_index:INTEGER_32
	window:GAME_WINDOW_SURFACED

	color,yellow,black:GAME_COLOR


end
