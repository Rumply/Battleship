note
	description: "Summary description for {ENGINE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ENGINE

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'
	AUDIO_LIBRARY_SHARED	-- To use `audio_library'
	CONSOLE_SHARED

feature {NONE}

	make
		do
			window.maximize

			create last_x.make_from_reference (0)
			create last_y.make_from_reference (0)

			create music_menu.make
			create keyboard.make
			create command

			input_buffer:=""
		end

	display_mode:GAME_DISPLAY_MODE
		local
			l_display_info:GAME_DISPLAY
		once
			create l_display_info.make (0)
			Result:=l_display_info.current_mode
		end

	window:GAME_WINDOW_SURFACED
		-- Dit au programme ou aller chercher l'emplacement de l'image `image_location'.
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
        once
            l_window_builder.set_dimension ((display_mode.width * 0.9).rounded,(display_mode.height * 0.9).rounded)
			l_window_builder.enable_border
			l_window_builder.set_title("BattleShip")
			Result:=l_window_builder.generate_window
        end

feature -- Run

	run_game
			-- Cette routine ajoute des events au controler de la librarie et de la fenêtre, puis lance la librairie.
		do
			game_library.quit_signal_actions.extend(agent on_quit(?))
			game_library.iteration_actions.extend (agent cycle(?))
			window.mouse_motion_actions.extend (agent on_mouse_move(?, ?, ?, ?))	-- When the user move the mouse on the window
			window.mouse_button_pressed_actions.extend (agent on_mouse_click(?,?,?))
			window.key_pressed_actions.extend (agent on_key_pressed(?,?))

			game_library.launch

		end

feature -- Implementation

	cycle(a_timestamp: NATURAL_32)
		-- Routine qui fait les mises à jours de l'écran et des sons.
		do
			window.update
			audio_library.update
			manage_cycle(a_timestamp)
		end

	manage_cycle(a_timestamp: NATURAL_32)
		do
		end

	on_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		-- Routine qui garde en mémoire l'emplacement du curseur lors de ses mouvements.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y
			manage_mouse_move(a_timestamp,a_mouse_state,a_delta_x, a_delta_y)
		end

	manage_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		do
		end

	on_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		-- Routine qui garde en mémoire les actions du curseur lorsqu'un click est effectué.
		do
			last_x:=a_mouse_state.x
			last_y:=a_mouse_state.y
			manage_mouse_click(a_timestamp,a_mouse_state,click_count)
		end

	manage_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		do
		end

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
		-- Routine qui est lancé lorsqu'un touche du clavier à été appuyé.
		-- Elle gère certaine touche et fait quelque chose dépendament quelle à été appuyé.
		local
			l_input:STRING
		do
			if attached console as l_console then
				l_input:=keyboard.get_key (a_key_state)
				if l_input.count = 1 then
					l_console.clear
					input_buffer:= input_buffer + l_input
					l_console.write (input_buffer) 	-- Pour le moment ils sont écrit dans la console, mais lorsque
													-- la boite de chat sera implémenté, ils iront dans la boite de chat.
				elseif l_input.is_equal ("backspace") and (input_buffer.count > 0) then
					input_buffer:=input_buffer.substring (1, input_buffer.count-1)
					l_console.clear
					if input_buffer.count > 0 then
						l_console.write (input_buffer)
					end
				elseif l_input.is_equal ("return") and (input_buffer.count > 0) then
					manage_command
				end
				manage_input(l_input, l_console)
			end
		end

	manage_input(a_input:STRING; a_console:MESSAGE_CONSOLE)
		do
		end

	manage_command
		do
		end

feature -- Access

	on_quit(a_timestamp: NATURAL_32)
			-- Cette routine ferme la librairie, lorsque le bouton X à été appuyer
		do

			game_library.stop  -- Arrête le controller en boucle.
		end

feature

	music_menu:SPEAKER

	command:COMMAND

--	window:GAME_WINDOW_SURFACED

	last_x, last_y:INTEGER
			-- Les dernières positions (x,y) de la sourie.

	quit:BOOLEAN
	stop:BOOLEAN

	keyboard:KEYBOARD

	input_buffer:STRING

end
