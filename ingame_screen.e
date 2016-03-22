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
		create chat_bordure.make_rect ("bois.jpg", l_double.floor, 290, 10)
		chat_bordure.enable_alpha_blending
		create grille.make (800, 800, 10)
		create bordure1.make_rect ("bois.jpg", 820, 820, 10)
		bordure1.enable_alpha_blending
		create background.make ("eau.jpg")
		create speaker.make ("speaker.png")

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		color:=black

		initialize_speaker
		initialize_chat_bordure
		initialize_grille
		initialize_bordure

		setup_object
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
		local
			l_x,l_y,l_width,l_height:INTEGER_32
			l_double:REAL_64
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
			if click then
				if speaker.hover then
					if not audio.muted then
						audio.mute
						speaker_off
					elseif audio.muted then
						audio.unmute
						speaker_on
					end
				end
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

	background,speaker:ELEMENT
	chat_bordure,bordure1:MASQUE
	grille:GRILLE_2

	window:GAME_WINDOW_SURFACED

	color,yellow,black:GAME_COLOR

end
