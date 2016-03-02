note
	description: "Game engine pour le menu principal."
	author: ""
	date: "$1 Mars 2016$"
	revision: "$1.0$"

class
	GAME_ENGINE

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'
create
	make

feature {NONE}

	make
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
		do
			l_window_builder.set_dimension (1500,1000)
			l_window_builder.set_title("BattleShip")
			window := l_window_builder.generate_window
			create menu.make_menu (window)
			create sound.make
		end

feature

	run_game
			-- Create ressources and launch the game
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
		do
			game_library.quit_signal_actions.extend(agent on_quit(?))
			game_library.iteration_actions.extend (agent cycle(?))
			window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?))	-- When the user move the mouse on the window
			game_library.launch
		end

feature {NONE} -- Implementation

	cycle(a_timestamp: NATURAL_32)
		do
			audio_library.update
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
	local
		l_x:INTEGER
		l_y:INTEGER
		hover1:BOOLEAN
		hover2:BOOLEAN
	do
		l_x:=a_mouse_state.x
		l_y:=a_mouse_state.y
		hover1:=False
		hover2:=False

		if l_x>menu.bouton1.x and l_x<(menu.bouton1.x+menu.btn_width) then
			if l_y>menu.bouton1.y and l_y<(menu.bouton1.y+menu.btn_height)then
				hover1:=True
			else
				hover1:=False
			end
		else
			hover1:=False
		end

		if l_x>menu.bouton2.x and l_x<(menu.bouton2.x+menu.btn_width) then
			if l_y>menu.bouton2.y and l_y<(menu.bouton2.y+menu.btn_height)then
				hover2:=True
			else
				hover2:=False
			end
		else
			hover2:=False
		end

		if hover1 then
			menu.hover_button_1
		elseif hover2 then
			menu.hover_button_2
		end


		if not hover1 then
			menu.normal_button_1
		end

		if not hover2 then
			menu.normal_button_2
		end

		window.update
		audio_library.update
	end

	on_quit(a_timestamp: NATURAL_32)
			-- This method is called when the quit signal is send to the application (ex: window X button pressed).
		do
			game_library.stop  -- Stop the controller loop (allow game_library.launch to return)
		end

feature {NONE} -- Access

	menu:MAIN_MENU
	window:GAME_WINDOW_SURFACED
	sound:SOUND

end
