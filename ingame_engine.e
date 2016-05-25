note
	description: "[
				Classe qui fait un surlignement de l'emplacement en jeu du curseur. La
				Classe contrôle aussi les sons dès le moment où l'application est lancée.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "16 mai 2016"
	revision: "1.5"

class
	INGAME_ENGINE

inherit
	ENGINE
		rename
			make as make_engine
		redefine
			manage_input,
			manage_mouse_move,
			manage_mouse_click,
			manage_cycle,
			manage_command
		end

create
	make

feature {NONE}

	make
		-- Routine qui lance le menu et la musique dès le lancement de l'application.
		do
			make_engine
			create menu.make (window,music_menu)

			music_menu.environement_audio.add ("theme1.wav")
			--music_menu.environement_audio.add ("theme2.wav")
			music_menu.environement_audio.start ("theme1.wav", -1)
			music_menu.environement_audio.play

			menu.speaker_on

			create server.make
			server.launch
		ensure
			music_menu_is_playing: music_menu.environement_audio.source.is_open
		--	music_menu_is_playing: music_menu.environement_audio.source.is_playing
		end

feature {NONE} -- Implementation

	manage_cycle(a_timestamp: NATURAL_32)
		do
			menu.cycle
		end

	manage_mouse_move(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y: INTEGER_32)
		do
			menu.left_mouse_click (last_x, last_y,False)

		end

	manage_mouse_click(a_timestamp: NATURAL_32;a_mouse_state: GAME_MOUSE_BUTTON_PRESSED_STATE; click_count: NATURAL_8)
		do
			if (a_mouse_state.is_left_button_pressed) then
				menu.left_mouse_click (last_x, last_y,True)
			elseif (a_mouse_state.is_right_button_pressed) then
				menu.right_mouse_click (last_x, last_y)
			end
		end

	manage_input(a_input:STRING)
		local
			l_text_surface:TEXT_SURFACE_BLENDED
		do

			if not input_buffer.is_empty then
				create l_text_surface.make (input_buffer, font, menu.black)
				menu.write_box(l_text_surface)
			elseif input_buffer.is_empty then
				window.surface.draw_surface (menu.dialogue, menu.dialogue.position.x, menu.dialogue.position.y)
			end
			if a_input.is_equal ("esc") then
				return_to_main_menu
			elseif a_input.is_equal ("return") then
				input_buffer:=""
			end
		end

	return_to_main_menu
		-- Routine qui crée et run le menu principale. Quand fini la librairie se ferme
		-- et alors tout les parent de `Current' vont fermer.
		do
			--window.stop_text_input
			window.clear_events
			game_library.clear_all_events
			music_menu.environement_audio.source.stop
			game_library.stop
		end

	manage_command
		local
			list_command:LIST[STRING_8]
		do
			list_command:=input_buffer.split (' ')
			if list_command.count > 0 then
				if list_command.at (1).is_equal ("connect") then
					command.connect (list_command.at (2), network)
				elseif list_command.at (1).is_equal ("host") then
					command.host(network)
				elseif list_command.at (1).is_equal ("msg") then
					if list_command.count > 1 then
						command.msg (list_command.at (2), network)
					end
				elseif list_command.at (1).is_equal ("read") then

				end
			end
		end

feature {NONE} -- Access

	menu:INGAME_SCREEN

	network:RESEAU
		once
			Result:=server
		end

	server:RESEAU


end
