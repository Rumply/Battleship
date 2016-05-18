note
	description: "Classe ou l'outil de discussion instantan�e est cr�� et utilis� en r�seau."
	author: "Francis Mathieu"
	date: "16 mai 2016"
	revision: "1.0"

class
	CHAT

inherit
	GAME_LIBRARY_SHARED

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		local
			l_builder:GAME_WINDOW_SURFACED_BUILDER
		do
			create texts.make
			window := l_builder.generate_window
			create font.make("font.ttf", 16)
			if font.is_openale then
				font.open
				has_error := not font.is_open
			else
				has_error := True
			end
		end


feature -- Access

	run
		do
			game_library.iteration_actions.extent (agent on_iteration)
			window.mouse_button_pressed_action.extend(agent on_mouse_pressed)
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.text_input_actions.extend (agent on_text_input)
			game_library.quit_signal_action.extend (agent on_quit)
			game_library.launch
		end

	has_error:BOOLEAN
		-- `True' si une erreur arrive lors de la cr�ation de `Current'

	window:GAME_WINDOW_SURFACED
		-- L'emplacement ou seront �crits les mots

	font:TEXT_FONT
		-- Utilis� pour dessin� `texts'

	texts:LINKED_LIST[TUPLE[x, y:INTEGER; text:STRING_32]]
		-- Chaque `text' est �crit aux coordon�es `x' et `y'

feature {NONE}

	on_iteration(a_timestamp:NATURAL_32)
		-- � chaque it�ration du jeu, red�ssine l'�cran
		local
			l_text_surface:TEXT_SURFACE_BLENDED
			l_color:GAME_COLOR
		do
			window.surface.draw_rectangle (create{GAME_COLOR}.make_rgb (255, 255, 255), 0, 0, window.width, window.height)
			create l_color.make_rgb (0, 0, 0)
			across
				texts as la_texts
			loop
				if not la_texts.item.text.is_empty then
					create l_text_surface.make (la_texts.item.text, font, l_color)
					window.surface.draw_surface (l_text_surface,la_texts.item.x, la_texts.item.y)
				end
			end
			window.update
		end

	on_mouse_pressed(a_timestamp:NATURAL_32; a_mouse_state:GAME_MOUSE_BUTTON_PRESSED_STATE; a_nb_click:NATURAL_8)
		-- Lorsque l'utilisateur click � l'aide de sa souris sur `a_window'
		do
			if a_nb_click = 1 and a_mouse_state.is_left_button_pressed then
				window.start_text_input
				texts.extend([a_mouse_state.x, a_mouse_state.y, {STRING_32}""])
			end
		end

	on_text_input(a_timestamp:NATURAL_32; a_text:STRING_32)
		--Lorsque l'utilisateur �crit quelque chose � l'aide de son clavier (Ne tient pas compte des touches sp�ciales tel que le backspace, return, etc.)
		do
			if not  texts.is_empty then
				texts.last.text := texts.last.text + a_text
			end
		end

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state:GAME_KEY_STATE)
		-- Lorsque l'utilisateur appuie sur une touche de son clavier
		do
			if a_key_state.is_backspace and not texts.last.text.is_empty then
				texts.last.text := tests.last.text.substring (1, texts.last.text.count - 1)
			elseif a_key_state.is_return or a_key_state.is_escape then
				window.stop_text_input
			end
		end

	on_quit(a_timestamp:NATURAL_32)
		-- Lorsque le syst�me d'op�ration demande au jeu de se fermer
		do
			game_library.stop
		end

	font_location: STRING_32
		-- Dit au programme ou aller chercher l'emplacement du font `font_location'.
        once
            Result := "./ressource/font/"
        end

feature -- Access

	chat:INGAME_SCREEN
end
