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
	do
		window:=a_window
		if attached console as l_console then
			l_console.clear
		end

		l_double:=(window.width/2-110)
		create chat_bordure.make_as_mask (l_double.floor, 290)
		chat_bordure.draw_rect_with_tile ("bois.jpg", l_double.floor, 290, 10)
		chat_bordure.enable_alpha_blending
		create grille.make (800, 800, 10)
		teste:=false
		create bordure1.make_as_mask (820, 820)
		bordure1.draw_rect_with_tile ("bois.jpg", 820, 820, 10)

		create background.make_as_mask (window.width, window.height)
		create background_tuile.make_element ("eau.jpg")

		speaker:=a_speaker

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		current_index:=1
		color:=black

		mouse_x:= 0
		mouse_y:= 0

		initialize_chat_bordure
		initialize_bordure
		load_case_element
		initialize_bateau

		setup_object
	end

	load_case_element
		-- Routine qui fait en sorte que la texture de bois soit autour du cadre (grille).
		-- Routine qui crée un pointeur à la position du curseur.
		do
			create pointer.make(grille.case_dimension)
		end

	set_as_default_pointer
		do
			pointer.surface.in_image_pos.x:=0
			pointer.surface.in_image_pos.y:=0
			pointer.surface.filedimension.width:=100
			pointer.surface.filedimension.height:=100
			pointer.surface.gamedimension.width:=grille.case_dimension.width
			pointer.surface.gamedimension.height:=grille.case_dimension.height
			pointer.surface.position.x:=0
			pointer.surface.position.y:=0
		end

	initialize_bateau
		do
			create boat.make(grille.case_dimension.width, grille.case_dimension.height)
			id_bateau:=0
		end

	initialize_chat_bordure
		-- Routine qui initialise la bordure de discussion instantanée.
		local
			l_double:REAL_64
		do
			l_double:=(window.width/1.8)
			chat_bordure.position.x:=l_double.floor
			l_double:=(window.height/1.5)
			chat_bordure.position.y:=l_double.floor
		end

	initialize_bordure
		-- Routine qui initialise les bordures de la grille.
		do
			bordure1.position.x:=grille.position.x - grille.dimension.bordure
			bordure1.position.y:=grille.position.y - grille.dimension.bordure
		end

	setup_border
		-- Routine qui dessine la grille, les bordures et les bordures de la discussion instantanée.
		do
			background.draw_surface (grille.masque, grille.position.x,grille.position.y)
			background.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			background.draw_surface (chat_bordure, chat_bordure.position.x, chat_bordure.position.y)
		end

	set_pointer
		do
			if (id_bateau=5) then
				set_as_default_pointer
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
				elseif grille.hover then
					grille.get_index_from_mousePos(mouse_x,mouse_y)
					set_pointer
					boat.set_bateau(id_bateau)
					if (id_bateau < 5) then
						position_bateau_temp:= ((grille.is_position_bateau_valide (boat.image_bateau.gamedimension.width, boat.image_bateau.gamedimension.height, true)))
						if grille.case_valide then
							boat.fill_bateau_list(id_bateau,position_bateau_temp)
							draw_case (mouse_x, mouse_y)
							id_bateau:= id_bateau + 1
						end
					else
						draw_pointer (mouse_x, mouse_y)
					end

					if id_bateau = 5 then
								set_as_default_pointer
					end
				elseif not grille.hover then
					window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				end

				click:=false
			end
		end

	mouse_click(a_x,a_y:INTEGER;a_click:BOOLEAN)
		-- Routine qui gère les éléments et les actions faites par le curseur.
		-- Routine qui applique les bateaux un par un lorsqu'un click est fait dans la grille, jusqu'à un maximum de 5 bateaux dans la grille.
		do
			mouse_x:= a_x
			mouse_y:= a_y
			speaker.surface.is_on (a_x, a_y)
			grille.is_on (a_x, a_y)
			click:= a_click
			if click then
				cycle
			end


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
				l_temp:=l_temp + grille.index
				grille.get_index_from_mousepos (a_x, a_y)
				grille.get_case_position
				grille.masque.draw_sub_surface_with_scale (l_bateau, l_bateau.in_image_pos.x,l_bateau.in_image_pos.y, l_bateau.filedimension.width, l_bateau.filedimension.height, grille.selected_pos.x-grille.position.x, grille.selected_pos.y-grille.position.y, l_bateau.gamedimension.width, l_bateau.gamedimension.height)
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
			end
		end

	draw_pointer(a_x,a_y:INTEGER_32)
		-- Routine qui dessine un élément temporaire à l'emplacement du curseur sur la grille.
		local
			l_temp:INTEGER_32
		do
			l_temp:=0
			l_temp:=l_temp + grille.index
			grille.get_index_from_mousepos (a_x, a_y)

			if not (grille.old_index = grille.index) then
				grille.get_case_position
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				window.surface.draw_sub_surface_with_scale (pointer.surface, pointer.surface.in_image_pos.x,pointer.surface.in_image_pos.y, pointer.surface.filedimension.width, pointer.surface.filedimension.height, grille.selected_pos.x, grille.selected_pos.y, pointer.surface.gamedimension.width, pointer.surface.gamedimension.height)
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

	click:BOOLEAN
	mouse_x,mouse_y:INTEGER
	boat:BATEAU
	pointer:VISEUR
	speaker:SPEAKER
	id_bateau:INTEGER_32
	teste:BOOLEAN
	background_tuile,background:MASQUE
	chat_bordure,bordure1:MASQUE
	grille:GRILLE
	current_index:INTEGER_32
	window:GAME_WINDOW_SURFACED

	color,yellow,black:GAME_COLOR

feature {NONE} -- Singleton


end
