note
	description: "[
				Classe qui innitialise l'arrière plan, les boutons, le haut-parleur, le titre
				à leur emplacement final lors du lancement de l'application.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "6 avril 2016"
	revision: "1.0"

class
	MAIN_MENU

create
	make

feature {NONE} -- Initialize

	make(a_window:GAME_WINDOW_SURFACED; a_speaker:SPEAKER)
		-- Ce constructeur permet de créé le menu principale du jeu.
	require
		a_window_is_open: a_window.surface.is_open
	do
		window:=a_window

		create masque.make (window.surface.width, window.surface.height)
		masque.enable_alpha_blending
		create background.make ("eau.jpg")
		create bouton_play.make ("main_button.png")
		create bouton.make (500, 250)

		speaker:=a_speaker

		create title.make ("title.png")

		create yellow.make_rgb (255, 255, 0)
		create black.make_rgb (0,0,0)

		color:=black
		singleGame:=False

		initialize_bouton_play

		initialize_title

		setup_object


	end

	initialize_bouton_play
		-- Routine qui initialise les attributs du bouton afin de jouer seul.
		local
			l_double:REAL_64
		do
			bouton_play.in_image_pos.x:=0
			bouton_play.in_image_pos.y:=0
			bouton_play.filedimension.width:=bouton_play.width.to_integer.quotient (2).truncated_to_integer
			bouton_play.filedimension.height:=bouton_play.height.to_integer.quotient (2).truncated_to_integer
			bouton_play.gamedimension.width:=500
			bouton_play.gamedimension.height:=250
			l_double:=window.width/2
			l_double:=l_double-(bouton_play.gamedimension.width/2)
			bouton_play.position.x:=l_double.floor
			l_double:=window.height/2
			l_double:=l_double-(bouton_play.gamedimension.height)
			bouton_play.position.y:=l_double.floor
		end

	initialize_title
	-- Routine qui initialise les attributs du titre dans le menu.
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
		do
			fill_background
			setup_button
			setup_title
			setup_speaker

			-- Routine qui met à jour les modifications de `window'.
			window.update
		end

	fill_background
		-- Routine qui dessine l'arrière plan.
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
				l_y:= l_y + height
			end
		end

	setup_title
		-- Routine qui dessine le titre.
		do
			draw(title)
		end

	setup_speaker
		-- Routine qui dessine le haut parleur.
		do
			draw(speaker.surface)
		end

	setup_button
		-- Routine qui dessine les boutons.
		do
			-- Bouton SinglePlayer
			draw_bouton(bouton_play)
		end

feature -- Access bouton

	mouse_click(audio:SPEAKER;a_x,a_y:INTEGER;click:BOOLEAN)
		-- Routine qui applique le BOOLEAN de click lorsque l'utilisateur appuis sur le haut-parleur afin de fermer ou d'ouvrir le son.
		do
			speaker.surface.is_on (a_x, a_y)
			bouton_play.is_on (a_x, a_y)
			if click then
				if speaker.surface.hover then
					if not audio.environement_audio.muted then
						audio.turnoff
					elseif audio.environement_audio.muted then
						audio.turnon
					end
				end

				if bouton_play.hover then
					bouton_play.set_selected (True)
					singleGame:=True
				elseif not bouton_play.hover then
					bouton_play.set_selected (False)
				end
			end

			if bouton_play.hover then
				bouton_play.in_image_pos.x:=500
				bouton_play.in_image_pos.y:=0
			elseif not bouton_play.hover then
				bouton_play.in_image_pos.x:=0
				bouton_play.in_image_pos.y:=0
			end

			if bouton_play.selected then
				color:=yellow
			elseif not bouton_play.selected then
				color:=black
			end
			draw_bouton(bouton_play)
		end

	draw(a_element:ELEMENT)
		-- Routine qui dessine les éléments de l'écran.
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
		-- Routine qui dessine les boutons à l'écran.
		do

			window.surface.draw_rectangle (color,
										a_bouton.position.x,
										a_bouton.position.y,
										a_bouton.gamedimension.width,
										a_bouton.gamedimension.height)
			draw(a_bouton)
		end

	speaker_on
		-- Routine qui dessine un haut-parleur ouvert.
		do
			speaker.turnon
			draw(speaker.surface)

		end

	speaker_off
		-- Routine qui dessine un haut-parleur barré.
		do
			speaker.turnOff
			draw(speaker.surface)
		end

feature -- Access variable

	speaker:SPEAKER

	bouton:BOUTON

	background,title,bouton_play:ELEMENT
		-- `background'`title'`bouton_play' sont tous des éléments de {ELEMENT} qui sont utilisé dans la classe {main_menu}

	masque:MASQUE -- `masque' sert de passerelle à la classe {MASQUE}

	singleGame:BOOLEAN -- Met le BOOL à 0 ou à 1 dépendant si l'utilisateur ne veut jouer qu'une seule partie ou non.

	window:GAME_WINDOW_SURFACED -- Affiche la fenêtre où les images seront appliquées et applique les dimensions de `a_window'

	color,yellow,black:GAME_COLOR -- Applique les couleurs à `color', `yellow' et `black'.

end
