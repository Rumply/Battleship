note
	description: "Classe ou est-ce que les cases sont surlignées lorsque le curseur de l'utilisateur passe par dessus."
	author: "Guillaume Hamel-Gagné"
	date: "5 avril 2016"
	revision: "1.1"

class
	CASE

inherit
	MASQUE
		rename
			make as make_as_mask
		end

create
	make

feature {NONE} -- Initialization

	make (a_x, a_y, a_width, a_height, a_bordure:INTEGER)
			-- Initialization for `Current'.
		require
			a_x_valide: a_x >= 0
			a_y_valide: a_y >= 0
			a_width_valide: a_width >= 0
			a_height_valide: a_height >= 0
			a_bordure_valide: a_bordure >= 0
		do
			create {TUPLE[width,height:INTEGER]} dimension -- crée le tuple pour les dimensions
			create {TUPLE[x,y:INTEGER]} position2 -- crée le tuple de la position2
			dimension.width:=a_width
			dimension.height:=a_height
			make_as_mask (dimension.width, dimension.height) -- Prend un élément et l'utilise comme masque.
			position.x:=a_x
			position.y:=a_y
			bordure:=a_bordure

		ensure
			positionX_set: position.x = a_x  -- position des x
			positionY_set: position.y = a_y -- position des y
			dimensionW_set: dimension.width = a_width -- dimension en largeur (width)
			dimensionH_set: dimension.height = a_height -- dimension en hauteur (height)
			dimensionB_set: bordure = a_bordure -- dimension des bordures
		end

feature {CASE} -- Access

	case: ELEMENT
			-- `case'
		attribute
			check False then
			end
		end --| Remove line when `case' is initialized in creation procedure.

feature -- Access

	position2:TUPLE[x,y:INTEGER_32]
	dimension:TUPLE[width,height:INTEGER_32]
end
