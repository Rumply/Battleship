note
	description: "Classe ou est-ce que les boutons sont crée et appliqué sur le menu."
	author: "Guillaume Hamel-Gagné"
	date: "4 avril 2016"
	revision: "1.0"

class
	BOUTON

inherit
	MASQUE
		rename
			make as make_masque
		end

create
	make

feature {NONE}

	make(a_width, a_height:INTEGER)
		-- Routine qui fait en sorte que l'écriture dans les boutons soit d'une certaine couleur et d'une certaine police d'écriture prédéfinie.
	do
		make_masque (a_width, a_height)
		initialize_bouton

	--	create bouton_play.make ("main_button.png")
	end

	initialize_bouton
		-- Routine qui initialise les attributs du bouton afin de jouer seul.
		local
			l_double:REAL_64
		do
			in_image_pos.x:=0
			in_image_pos.y:=0
			filedimension.width:=width.to_integer.quotient (2).truncated_to_integer
			filedimension.height:=height.to_integer.quotient (2).truncated_to_integer
			gamedimension.width:=500
			gamedimension.height:=250
--			l_double:=window.width/2
--			l_double:=l_double-(gamedimension.width/2)
--			position.x:=l_double.floor
--			l_double:=window.height/2
--			l_double:=l_double-(gamedimension.height)
--			position.y:=l_double.floor
		end

feature --Access


end
