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
		create bouton.make_surface ("main_button.jpg")
		create title.make_surface ("title.png")

		create {TUPLE[x,y:INTEGER]} bouton1.default_create
		bouton1.x:= 500
		bouton1.y:= 300
		create {TUPLE[x,y:INTEGER]} bouton2.default_create
		bouton2.x:= 500
		bouton2.y:= 600

		create {TUPLE[x,y:INTEGER]} speaker_pos.default_create
		speaker_pos.x:= 10
		speaker_pos.y:= 10

		Speaker_Scale_width:=50
		Speaker_Scale_height:=50

		create speaker.make_surface ("speaker.png")

		cycle(a_window)
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
		local
			width,height:INTEGER
		do
			-- Draw the scene
			width:=title.width.to_integer
			height:=title.height.to_integer

			-- Image title
			menu.surface.draw_sub_surface_with_scale (title, 0, 0, width, height, 375, 50, 750, 200)

		end

	setup_speaker
		do
			Speaker_width:=speaker.width.to_integer.quotient (2).truncated_to_integer
			Speaker_height:=speaker.height.to_integer

			menu.surface.draw_sub_surface_with_scale (speaker, 0, 0, Speaker_width, Speaker_height,
													  Speaker_pos.x,Speaker_pos.y, Speaker_Scale_width,
													  Speaker_Scale_height)

		end

	setup_button
		do
			-- Draw the scene
			BTN_width:=bouton.width.to_integer.quotient (2).truncated_to_integer
			BTN_height:=bouton.height.to_integer.quotient (2).truncated_to_integer

			-- Bouton SinglePlayer
			menu.surface.draw_sub_surface (bouton, 0, 0, BTN_width, BTN_height, bouton1.x, bouton1.y)

			-- Bouton MultiPlayer
			menu.surface.draw_sub_surface (bouton, 0, 250, BTN_width, BTN_height, bouton2.x, bouton2.y)

		end

feature -- Access

	-- Bouton 1 joueur

	hover_button_1
		do
			menu.surface.draw_sub_surface (bouton, 500, 0, BTN_width, BTN_height, bouton1.x, bouton1.y)
		end

	normal_button_1
		do
			menu.surface.draw_sub_surface (bouton, 0, 0, BTN_width, BTN_height, bouton1.x, bouton1.y)
		end

	-- Bouton 2 joueur

	hover_button_2
		do
			menu.surface.draw_sub_surface (bouton, 500, 250, BTN_width, BTN_height, bouton2.x, bouton2.y)
		end

	normal_button_2
		do
			menu.surface.draw_sub_surface (bouton, 0, 250, BTN_width, BTN_height,bouton2.x, bouton2.y)
		end

	speaker_on
		do
			menu.surface.draw_sub_surface_with_scale (speaker, 0, 0, speaker_width, speaker_height, speaker_pos.x, speaker_pos.y, 50, 50)
		end
	speaker_off
		do
			menu.surface.draw_sub_surface_with_scale (speaker, 250, 0, speaker_width, speaker_height, speaker_pos.x, speaker_pos.y, 50, 50)
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

	title:ELEMENT
	background:ELEMENT
	bouton:ELEMENT
	speaker:ELEMENT

	menu:GAME_WINDOW_SURFACED

	bouton1:TUPLE[x,y:INTEGER]
	bouton2:TUPLE[x,y:INTEGER]
	speaker_pos:TUPLE[x,y:INTEGER]

	BTN_width,BTN_height,Speaker_width,Speaker_height,Speaker_Scale_width,Speaker_Scale_height:INTEGER


end
