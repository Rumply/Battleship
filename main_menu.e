note
	description: "Summary description for {MAIN_MENU}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_MENU

create
	make_menu

feature {NONE} -- Initialize

	make_menu(a_window:GAME_WINDOW_SURFACED)
	do

		create background.make_surface ("eau.jpg")
		create bouton_s.make_surface ("main_button.jpg")
		create bouton_m.make_surface ("main_button.jpg")
		create speaker.make_surface ("speaker.png")
		create title.make_surface ("title.png")

		initialize_bouton_s
		initialize_bouton_m
		initialize_speaker
		initialize_title
		cycle(a_window)
	end

	initialize_bouton_s
		do
			bouton_s.position.x:=500
			bouton_s.position.y:=300
			bouton_s.in_image_pos.x:=0
			bouton_s.in_image_pos.y:=0
			bouton_s.filedimension.width:=bouton_s.width.to_integer.quotient (2).truncated_to_integer
			bouton_s.filedimension.height:=bouton_s.height.to_integer.quotient (2).truncated_to_integer
			bouton_s.gamedimension.width:=500
			bouton_s.gamedimension.height:=250
		end

	initialize_bouton_m
		do
			bouton_m.position.x:=500
			bouton_m.position.y:=600
			bouton_m.in_image_pos.x:=0
			bouton_m.in_image_pos.y:=250
			bouton_m.filedimension.width:=bouton_m.width.to_integer.quotient (2).truncated_to_integer
			bouton_m.filedimension.height:=bouton_m.height.to_integer.quotient (2).truncated_to_integer
			bouton_m.gamedimension.width:=500
			bouton_m.gamedimension.height:=250
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
		do
			title.position.x:=375
			title.position.y:=50
			title.in_image_pos.x:=0
			title.in_image_pos.y:=0
			title.filedimension.width:=title.width
			title.filedimension.height:=title.height
			title.gamedimension.width:=750
			title.gamedimension.height:=100
		end

feature {NONE} -- Implementation

	cycle(a_window:GAME_WINDOW_SURFACED)
			-- Event that is launch at each iteration.
		do
			menu:= a_window

			fill_background
			setup_button
			setup_title
			setup_speaker

			-- Update modification in the screen
			menu.update
		end

	fill_background
		local
			width,height,l_Wreste,l_Hreste,l_x,l_y:INTEGER
		do
			-- Draw the scene
			width:=background.width.to_integer
			height:=background.height.to_integer
			l_x:=0
			l_y:=0

			from
				l_Hreste:=menu.height.to_integer
			until
				l_Hreste <= 0
			loop
				from
					l_Wreste:=menu.width.to_integer
				until
					l_Wreste <= 0
				loop
					l_Wreste:= l_Wreste - width
					menu.surface.draw_surface(background, l_x, l_y)
					l_x:= l_x + width
				end
				l_x:=0
				l_Hreste:= l_Hreste - height
				menu.surface.draw_surface(background, l_x, l_y)
				l_y:= l_y + height
			end
		end

	setup_title
		do
			-- Image title
			menu.surface.draw_sub_surface_with_scale (title,
														title.in_image_pos.x,
														title.in_image_pos.y,
														title.filedimension.width,
														title.filedimension.height,
														title.position.x,
														title.position.y,
														title.gamedimension.width,
														title.gamedimension.height)

		end

	setup_speaker
		do
			menu.surface.draw_sub_surface_with_scale (speaker,
														speaker.in_image_pos.x,
														speaker.in_image_pos.y,
														speaker.filedimension.width,
														speaker.filedimension.height,
														speaker.position.x,
														speaker.position.y,
														speaker.gamedimension.width,
														speaker.gamedimension.height)

		end

	setup_button
		do
			-- Bouton SinglePlayer
			normal_button_1

			-- Bouton MultiPlayer
			normal_button_2

		end

feature -- Access

	mouse_click(audio:SOUND_ENGINE;a_x,a_y:INTEGER;click:BOOLEAN)
		do
			if click then
				speaker.is_on (a_x, a_y)
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

			bouton_s.is_on (a_x, a_y)
			if bouton_s.hover then
				hover_button_1
			elseif not bouton_s.hover then
				normal_button_1
			end

			bouton_m.is_on (a_x, a_y)
			if bouton_m.hover then
				hover_button_2
			elseif not bouton_m.hover then
				normal_button_2
			end

		end

	-- Bouton 1 joueur

	draw_bouton(a_bouton:ELEMENT)
		do
			menu.surface.draw_sub_surface_with_scale (a_bouton,
														a_bouton.in_image_pos.x,
														a_bouton.in_image_pos.y,
														a_bouton.filedimension.width,
														a_bouton.filedimension.height,
														a_bouton.position.x,
														a_bouton.position.y,
														a_bouton.gamedimension.width,
														a_bouton.gamedimension.height)
		end

	hover_button_1
		do
			bouton_s.in_image_pos.x:=500
			bouton_s.in_image_pos.y:=0
			draw_bouton(bouton_s)
		end

	normal_button_1
		do
			bouton_s.in_image_pos.x:=0
			bouton_s.in_image_pos.y:=0
			draw_bouton(bouton_s)
		end

	-- Bouton 2 joueur

	hover_button_2
		do

			bouton_m.in_image_pos.x:=500
			bouton_m.in_image_pos.y:=250
			draw_bouton(bouton_m)
		end

	normal_button_2
		do

			bouton_m.in_image_pos.x:=0
			bouton_m.in_image_pos.y:=250
			draw_bouton(bouton_m)
		end

	speaker_on
		do
			speaker.in_image_pos.x:=0
			speaker.in_image_pos.y:=0
			draw_bouton(speaker)
		end
	speaker_off
		do
			speaker.in_image_pos.x:=250
			speaker.in_image_pos.y:=0
			draw_bouton(speaker)
		end

	x:INTEGER assign set_x
			-- Vertical position of `Current'

	y:INTEGER assign set_y
			-- Horizontal position of `Current'

	set_x(a_x:INTEGER)
			-- Assign the value of `x' with `a_x'
		do
			x := a_x
		ensure
			Is_Assign: x = a_x
		end

	set_y(a_y:INTEGER)
			-- Assign the value of `y' with `a_y'
		do
			y := a_y
		ensure
			Is_Assign: y = a_y
		end

	background,title,bouton_S,bouton_M,speaker:ELEMENT

	menu:GAME_WINDOW_SURFACED

	BTN_width,BTN_height,Speaker_width,Speaker_height,Speaker_Scale_width,Speaker_Scale_height:INTEGER


end
