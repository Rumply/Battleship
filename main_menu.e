note
	description: "Summary description for {MAIN_MENU}."
	author: "Guillaume Hamel-Gagné"
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_MENU

create
	make

feature {NONE} -- Initialize

	make(a_window:GAME_WINDOW_SURFACED)
	do
		window:=a_window

		create masque.make_as_mask (window.surface.width, window.surface.height)
		masque.enable_alpha_blending
		create background.make ("eau.jpg")
		create bouton_s.make ("main_button.png")
		create bouton_m.make ("main_button.png")
		create speaker.make ("speaker.png")
		create title.make ("title.png")

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		color:=black
		singleGame:=False

		initialize_bouton_s
		initialize_bouton_m

		initialize_speaker
		initialize_title

		setup_object
	end

	initialize_bouton_s
		local
			l_double:REAL_64
		do
			bouton_s.in_image_pos.x:=0
			bouton_s.in_image_pos.y:=0
			bouton_s.filedimension.width:=bouton_s.width.to_integer.quotient (2).truncated_to_integer
			bouton_s.filedimension.height:=bouton_s.height.to_integer.quotient (2).truncated_to_integer
			bouton_s.gamedimension.width:=500
			bouton_s.gamedimension.height:=250
			l_double:=window.width/2
			l_double:=l_double-(bouton_s.gamedimension.width/2)
			bouton_s.position.x:=l_double.floor
			l_double:=window.height/2
			l_double:=l_double-(bouton_s.gamedimension.height)
			bouton_s.position.y:=l_double.floor
		end

	initialize_bouton_m
		local
			l_double:REAL_64
		do
			bouton_m.filedimension.width:=bouton_m.width.to_integer.quotient (2).truncated_to_integer
			bouton_m.filedimension.height:=bouton_m.height.to_integer.quotient (2).truncated_to_integer
			bouton_m.gamedimension.width:=500
			bouton_m.gamedimension.height:=250
			l_double:=window.width/2
			l_double:=l_double-(bouton_m.gamedimension.width/2)
			bouton_m.position.x:=l_double.floor
			l_double:=window.height/2
			l_double:=l_double+(bouton_m.gamedimension.height/2)
			bouton_m.position.y:=l_double.floor
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

	initialize_title
		local
			l_double:REAL_64
		do
			title.position.y:=50
			title.in_image_pos.x:=0
			title.in_image_pos.y:=0
			title.filedimension.width:=title.width
			title.filedimension.height:=title.height
			title.gamedimension.width:=750
			title.gamedimension.height:=100
			l_double:=window.width/2
			l_double:=l_double-(title.gamedimension.width/2)
			title.position.x:=l_double.floor
		end

feature {NONE} -- Implementation

	setup_object
			-- Event that is launch at each iteration.
		do
			fill_background
			setup_button
			setup_title
			setup_speaker

			-- Update modification in the screen
			window.update
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

	setup_title
		do
			draw(title)
		end

	setup_speaker
		do
			draw(speaker)
		end

	setup_button
		do
			-- Bouton SinglePlayer
			draw_bouton(bouton_s)

			-- Bouton MultiPlayer
			draw_bouton(bouton_m)
		end

feature -- Access bouton

	mouse_click(audio:SOUND_ENGINE;a_x,a_y:INTEGER;click:BOOLEAN)
		do
			speaker.is_on (a_x, a_y)
			bouton_s.is_on (a_x, a_y)
			bouton_m.is_on (a_x, a_y)
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

				if bouton_s.hover then
					bouton_s.set_selected (True)
					singleGame:=True
				elseif not bouton_s.hover then
					bouton_s.set_selected (False)
				end
				if bouton_m.hover then
					bouton_m.set_selected (True)
				elseif not bouton_m.hover then
					bouton_m.set_selected (False)
				end
			end

			if bouton_s.hover then
				bouton_s.in_image_pos.x:=500
				bouton_s.in_image_pos.y:=0
			elseif not bouton_s.hover then
				bouton_s.in_image_pos.x:=0
				bouton_s.in_image_pos.y:=0
			end

			if bouton_m.hover then
				bouton_m.in_image_pos.x:=500
				bouton_m.in_image_pos.y:=250
			elseif not bouton_m.hover then
				bouton_m.in_image_pos.x:=0
				bouton_m.in_image_pos.y:=250
			end

			if bouton_s.selected then
				color:=yellow
			elseif not bouton_s.selected then
				color:=black
			end
			draw_bouton(bouton_s)

			if bouton_m.selected then
				color:=yellow
			elseif not bouton_m.selected then
				color:=black
			end
			draw_bouton(bouton_m)
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

feature -- Access variable

	background,title,bouton_S,bouton_M,speaker:ELEMENT
	masque:MASQUE

	singleGame:BOOLEAN

	window:GAME_WINDOW_SURFACED

	color,yellow,black:GAME_COLOR

end
