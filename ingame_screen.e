note
	description: "Summary description for {INGAME_SCREEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INGAME_SCREEN

create
	make

feature {NONE}

	make(a_window:GAME_WINDOW_SURFACED)
	local
		l_double:REAL_64
	do
		window:=a_window
		l_double:=(window.width/2-110)
		create chat_bordure.make_as_mask (l_double.floor, 290)
		chat_bordure.draw_rect_with_tile ("bois.jpg", l_double.floor, 290, 10)
		chat_bordure.enable_alpha_blending
		create grille.make (800, 800, 10)

		create background.make_element ("eau.jpg")
		create speaker.make_element ("speaker.png")

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		current_index:=1
		color:=black

		initialize_speaker
		initialize_chat_bordure
		initialize_grille

		load_case_element

		initialize_bordure

		setup_object
	end

	load_case_element
		do
			create bordure1.make_as_mask (820, 820)
			bordure1.draw_rect_with_tile ("bois.jpg", 820, 820, 10)

			create pointer.make_as_mask (grille.case_dimension.width, grille.case_dimension.height)
			pointer.draw_surface_with_scale (grille.viseur, 0, 0, grille.case_dimension.width, grille.case_dimension.height)

			nb_bateau:=0
		end

	set_as_bateau1(a_bateau:MASQUE)
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
		local
			l_double:REAL_64
		do
			l_double:=(window.width/1.8)
			chat_bordure.position.x:=l_double.floor
			l_double:=(window.height/1.5)
			chat_bordure.position.y:=l_double.floor

		end

	initialize_bordure
		do
			bordure1.position.x:=grille.position.x - grille.dimension.bordure
			bordure1.position.y:=grille.position.y - grille.dimension.bordure
		end

	fill_background
		local
			width,height,l_Wreste,l_Hreste,l_x,l_y:INTEGER
		do
			-- Draw the scene
			width:=background.width
			height:=background.height
			l_x:=0
			l_y:=0

			from
				l_Hreste:=window.height
			until
				l_Hreste <= 0
			loop
				from
					l_Wreste:=window.width
				until
					l_Wreste <= 0
				loop
					l_Wreste:= l_Wreste - width
					window.surface.draw_surface(background, l_x, l_y)
					l_x:= l_x + width
				end
				l_x:=0
				l_Hreste:= l_Hreste - height
				window.surface.draw_surface(background, l_x, l_y)
				l_y:= l_y + height
			end
		end

	setup_speaker
		do
			draw(speaker)
		end

	setup_border
		do
			window.surface.draw_surface (grille.masque, grille.position.x,grille.position.y)
			window.surface.draw_surface (bordure1, bordure1.position.x, bordure1.position.y)
			window.surface.draw_surface (chat_bordure, chat_bordure.position.x, chat_bordure.position.y)
		end

feature -- Access

	setup_object
			-- Event that is launch at each iteration.
		do
			fill_background
			setup_border
			setup_speaker

			-- Update modification in the screen
			window.update
		end

	mouse_click(audio:SOUND_ENGINE;a_x,a_y:INTEGER;click:BOOLEAN)
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
					draw_case (a_x, a_y,nb_bateau)
					nb_bateau:= nb_bateau + 1
				elseif not grille.hover then
					window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				end

			elseif not click then
				if grille.hover then
					draw_pointer (a_x, a_y)
				else
					window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				end
			end
		end

	draw_case(a_x,a_y,a_nb_bateau:INTEGER_32)
		local
			l_temp:INTEGER_32

		do
			if (a_nb_bateau=0) then
				set_as_bateau1 (image_bateau)
			elseif (a_nb_bateau=1) then
				set_as_bateau2 (image_bateau)
			elseif (a_nb_bateau=2) then
				set_as_bateau3 (image_bateau)
			elseif (a_nb_bateau=3) then
				set_as_bateau4 (image_bateau)
			elseif (a_nb_bateau=4) then
				set_as_bateau5 (image_bateau)
			end
			if (a_nb_bateau<5) then
				l_temp:=l_temp + grille.index
				grille.get_index_from_mousepos (a_x, a_y)
				grille.get_case_position
				grille.masque.draw_sub_surface_with_scale (image_bateau, image_bateau.in_image_pos.x,image_bateau.in_image_pos.y, image_bateau.filedimension.width, image_bateau.filedimension.height, grille.selected_pos.x-grille.position.x, grille.selected_pos.y-grille.position.y, image_bateau.gamedimension.width, image_bateau.gamedimension.height)
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
			end
		end

	draw_pointer(a_x,a_y:INTEGER_32)
		local
			l_temp:INTEGER_32
		do
			l_temp:=l_temp + grille.index
			grille.get_index_from_mousepos (a_x, a_y)
			if not (l_temp = grille.index) then
				grille.get_case_position
				window.surface.draw_surface (grille.masque, grille.position.x, grille.position.y)
				window.surface.draw_surface (pointer, grille.selected_pos.x, grille.selected_pos.y)
			end
		end

	draw(a_element:ELEMENT)
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

	-- Bouton 1 joueur

	draw_bouton(a_bouton:ELEMENT)
		do

			window.surface.draw_rectangle (color,
										a_bouton.position.x,
										a_bouton.position.y,
										a_bouton.gamedimension.width,
										a_bouton.gamedimension.height)
			draw(a_bouton)
		end

	speaker_on
		do
			speaker.in_image_pos.x:=0
			speaker.in_image_pos.y:=0
			draw(speaker)
		end
	speaker_off
		do
			speaker.in_image_pos.x:=250
			speaker.in_image_pos.y:=0
			draw(speaker)
		end

	nb_bateau:INTEGER_32

	background,speaker:MASQUE
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
