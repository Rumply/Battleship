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

create
	make

feature {NONE}

	make(a_window:GAME_WINDOW_SURFACED)
	require
		a_window_is_open: a_window.surface.is_open
	local
		l_double:REAL_64
	do
		window:=a_window
		l_double:=(window.width/2-110)
		create chat_bordure.make_as_mask (l_double.floor, 290)
		chat_bordure.draw_rect_with_tile ("bois.jpg", l_double.floor, 290, 10)
		chat_bordure.enable_alpha_blending
		create grille.make (800, 800, 10)

		create bordure1.make_as_mask (820, 820)
		bordure1.draw_rect_with_tile ("bois.jpg", 820, 820, 10)

		create background.make_as_mask (window.width, window.height)
		create background_tuile.make_element ("eau.jpg")
		create speaker.make_element ("speaker.png")

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		current_index:=1
		color:=black

		initialize_speaker
		initialize_chat_bordure
		initialize_grille

		initialize_bordure

		load_case_element

		setup_object
	end

	load_case_element
		-- Routine qui fait en sorte que la texture de bois soit autour du cadre (grille).
		-- Routine qui crée un pointeur à la position du curseur.
		do

			create pointer.make_as_mask (grille.case_dimension.width*5, grille.case_dimension.height*5)
			pointer.draw_surface_with_scale (grille.viseur, 0, 0, grille.case_dimension.width, grille.case_dimension.height)

			nb_bateau:=0
		end

	set_as_default_pointer
		do
			pointer.in_image_pos.x:=0
			pointer.in_image_pos.y:=0
			pointer.filedimension.width:=100
			pointer.filedimension.height:=100
			pointer.gamedimension.width:=grille.case_dimension.width
			pointer.gamedimension.height:=grille.case_dimension.height
			pointer.position.x:=0
			pointer.position.y:=0
		end

	set_as_bateau1(a_bateau:MASQUE)
		-- Routine qui impose les attributs de `a_bateau'.
		do
			a_bateau.in_image_pos.x:=0
			a_bateau.in_image_pos.y:=0
			a_bateau.filedimension.width:=380
			a_bateau.filedimension.height:=80
			a_bateau.gamedimension.width:=grille.case_dimension.width*4
			a_bateau.gamedimension.height:=grille.case_dimension.height
			a_bateau.position.x:=0
			a_bateau.position.y:=0
		end

	set_as_bateau2(a_bateau:MASQUE)
		-- Routine qui impose les attributs de `a_bateau'.
		do
			a_bateau.in_image_pos.x:=0
			a_bateau.in_image_pos.y:=80
			a_bateau.filedimension.width:=280
			a_bateau.filedimension.height:=80
			a_bateau.gamedimension.width:=grille.case_dimension.width*3
			a_bateau.gamedimension.height:=grille.case_dimension.height
			a_bateau.position.x:=0
			a_bateau.position.y:=0
		end

	set_as_bateau3(a_bateau:MASQUE)
	-- Routine qui impose les attributs de `a_bateau'.
		do
			a_bateau.in_image_pos.x:=0
			a_bateau.in_image_pos.y:=160
			a_bateau.filedimension.width:=280
			a_bateau.filedimension.height:=80
			a_bateau.gamedimension.width:=grille.case_dimension.width*3
			a_bateau.gamedimension.height:=grille.case_dimension.height
			a_bateau.position.x:=0
			a_bateau.position.y:=0
		end

	set_as_bateau4(a_bateau:MASQUE)
	-- Routine qui impose les attributs de `a_bateau'.
		do
			a_bateau.in_image_pos.x:=0
			a_bateau.in_image_pos.y:=240
			a_bateau.filedimension.width:=180
			a_bateau.filedimension.height:=80
			a_bateau.gamedimension.width:=grille.case_dimension.width*2
			a_bateau.gamedimension.height:=grille.case_dimension.height
			a_bateau.position.x:=0
			a_bateau.position.y:=0
		end

	set_as_bateau5(a_bateau:MASQUE)
	-- Routine qui impose les attributs de `a_bateau'.
		do
			a_bateau.in_image_pos.x:=0
			a_bateau.in_image_pos.y:=320
			a_bateau.filedimension.width:=380
			a_bateau.filedimension.height:=80
			a_bateau.gamedimension.width:=grille.case_dimension.width*5
			a_bateau.gamedimension.height:=grille.case_dimension.height
			a_bateau.position.x:=0
			a_bateau.position.y:=0
		end

	initialize_speaker
		-- Routine qui impose les attributs du haut-parleur.
		do
			speaker.position.x:=10
			speaker.position.y:=10
			speaker.in_image_pos.x:=0
			speaker.in_image_pos.y:=0
			speaker.filedimension.width:=speaker.width.to_integer.quotient (2).truncated_to_integer
			speaker.filedimension.height:=speaker.height
			speaker.gamedimension.width:=50
			speaker.gamedimension.height:=50
		end

	initialize_grille
		-- Routine qui initialise les attributs de la grille.
		do
			grille.position.x:=80
			grille.position.y:=80
			grille.dimension.width:=800
			grille.dimension.height:=800
			grille.dimension.bordure:=10
			grille.selected_pos.x:=grille.position.x
			grille.selected_pos.y:=grille.position.y
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

	setup_speaker
		-- Routine qui dessine un haut-parleur à l'écran.
		do
			draw(speaker)
		end

	setup_border
		-- Routine qui dessine la grille, les bordures et les bordures de la discussion instantanée.
		do
			background.draw_surface (grille.masque, grille.position.x,grille.position.y)
			--window.surface.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			background.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			background.draw_surface (chat_bordure, chat_bordure.position.x, chat_bordure.position.y)
		end

	set_pointer
		do
			if (nb_bateau=0) then
				set_as_bateau1 (image_bateau)
			elseif (nb_bateau=1) then
				set_as_bateau2 (image_bateau)
			elseif (nb_bateau=2) then
				set_as_bateau3 (image_bateau)
			elseif (nb_bateau=3) then
				set_as_bateau4 (image_bateau)
			elseif (nb_bateau=4) then
				set_as_bateau5 (image_bateau)
			end

			if (nb_bateau>4) then
				set_as_default_pointer
				pointer:=grille.viseur
			else
				pointer:=image_bateau
			end

		end

	setup_object
			-- Event that is launch at each iteration.
		do
			fill_background
			setup_border
			setup_speaker

			window.surface.draw_surface (background, 0,0)
			-- Update modification in the screen
			window.update
		end

feature -- Access

	draw_on_window(a_other:GAME_SURFACE;a_x,a_y:INTEGER)
		do
			--window.surface.draw_surface (background, 0,0)
			window.surface.draw_surface (a_other, a_x, a_y)
		end

	draw_on_window_with_scale(a_other:GAME_SURFACE;a_x_source,a_y_source,a_width,a_height,a_x_destination,a_y_destination:INTEGER)
		do
			--window.surface.draw_surface (background, 0,0)
			window.surface.draw_sub_surface (a_other, a_x_source, a_y_source, a_width, a_height, a_x_destination, a_y_destination)
		end

	mouse_click(audio:SOUND_ENGINE;a_x,a_y:INTEGER;click:BOOLEAN)
		-- Routine qui gère les éléments et les actions faites par le curseur.
		-- Routine qui applique les bateaux un par un lorsqu'un click est fait dans la grille, jusqu'à un maximum de 5 bateaux dans la grille.
		do
			speaker.is_on (a_x, a_y)
			grille.is_on (a_x, a_y)
			if click then
				if speaker.hover then
					if not audio.muted then
						audio.mute
						speaker_off
					elseif audio.muted then
						audio.unmute
						speaker_on
					end
				elseif grille.hover then
					grille.is_position_bateau_valide (pointer.gamedimension.width, pointer.gamedimension.height, true)
					set_pointer
					if grille.case_valide then
						nb_bateau:= nb_bateau + 1
						draw_case (a_x, a_y)
					end
				elseif not grille.hover then
					draw_on_window (grille.masque, grille.position.x, grille.position.y)
				end

			elseif not click then
				if grille.hover then
					grille.is_position_bateau_valide (pointer.gamedimension.width, pointer.gamedimension.height, false)
					set_pointer
					draw_pointer (a_x, a_y)
				else
					draw_on_window (grille.masque, grille.position.x, grille.position.y)
				end
			end
		end

	fill_background
		-- Routine qui remplit l'arrière plan avec une image prédéfinie.
		local
			width,height,l_Wreste,l_Hreste,l_x,l_y:INTEGER
		do
			background.draw_background_with_tuile (background_tuile)
			window.surface.draw_surface(background, 0, 0)
		end

	draw_case(a_x,a_y:INTEGER)
		-- Routine qui applique les bateaux un par un sur la grille. Le nombre de bateau maximum est de 5.
		local
			l_temp:INTEGER_32

		do
			if (nb_bateau<6) then
				l_temp:=l_temp + grille.index
				grille.get_index_from_mousepos (a_x, a_y)
				grille.get_case_position
				grille.masque.draw_sub_surface_with_scale (image_bateau, image_bateau.in_image_pos.x,image_bateau.in_image_pos.y, image_bateau.filedimension.width, image_bateau.filedimension.height, grille.selected_pos.x-grille.position.x, grille.selected_pos.y-grille.position.y, image_bateau.gamedimension.width, image_bateau.gamedimension.height)
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
			end
		end

	draw_pointer(a_x,a_y:INTEGER_32)
		-- Routine qui dessine un élément temporaire à l'emplacement du curseur sur la grille.
		local
			l_temp:INTEGER_32
		do
			l_temp:=l_temp + grille.index
			grille.get_index_from_mousepos (a_x, a_y)
			if not (l_temp = grille.index) then
				grille.get_case_position
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				window.surface.draw_sub_surface (pointer, image_bateau.in_image_pos.x, image_bateau.in_image_pos.y, image_bateau.gamedimension.width, image_bateau.gamedimension.height, grille.selected_pos.x, grille.selected_pos.y)
			end
		end

	draw(a_element:ELEMENT)
		-- Routine qui dessine à l'écran les éléments de a_element.
		do
			background.draw_sub_surface_with_scale (a_element,
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
			speaker.in_image_pos.x:=0
			speaker.in_image_pos.y:=0
			draw(speaker)
		end

	speaker_off
		-- Routine qui dessine un haut-parleur barré.
		do
			speaker.in_image_pos.x:=250
			speaker.in_image_pos.y:=0
			draw(speaker)
		end

	nb_bateau:INTEGER_32

	background_tuile,background,speaker:MASQUE
	chat_bordure,bordure1,pointer:MASQUE
	grille:GRILLE
	current_index:INTEGER_32
	window:GAME_WINDOW_SURFACED

	color,yellow,black:GAME_COLOR

feature {NONE} -- Singleton

	image_bateau: MASQUE
            -- `Result' is DIRECTORY constant named image_location.
        once
            --Result := {ELEMENT} create image_bateau.make ("bateaux.png")
            create Result.make_element ("bateaux.png")
        end

end
