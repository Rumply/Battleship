note
	description: "Classe ou les dialogues en jeu sont créé à des fin d'apprentisage."
	author: "Guillaume Hamel-Gagné"
	date: "$Date$"
	revision: "$Revision$"

class
	DIALOGUE

inherit
	MASQUE
		rename
			make as make_masque
		end

create
	make

feature {NONE} -- Initialization

	make(a_window:GAME_WINDOW_SURFACED)
			-- Initialization for `Current'.
		local
			l_double:REAL_64
			l_width,l_height:INTEGER
		do
			window:=a_window
			create background_tuile.make_element ("eau.jpg")

			l_double:=(window.width/2-110)
			bordure:=((l_double.floor)/60).floor

			l_width:=(window.width/1.5).floor
			l_height:=(window.height/4.5).floor

			make_masque(l_width,l_height)

			draw_background_with_tuile (background_tuile)
			draw_rect_with_tile ("bois.jpg", gamedimension.width, gamedimension.height, bordure)
			enable_alpha_blending

			l_double:=(window.width/7.5)
			position.x:=l_double.floor
			l_double:=(window.height/1.4)
			position.y:=l_double.floor


		end

feature -- Access



feature {NONE}-- Access

	window:GAME_WINDOW_SURFACED
	background_tuile:MASQUE
end
