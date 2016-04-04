note
	description: "Classe ou est-ce que les cases sont surlignées lorsque le curseur de l'utilisateur passe par dessus."
	author: "Guillaume Hamel-Gagné"
	date: "$Date$"
	revision: "$Revision$"

class
	CASE

inherit
	MASQUE

create
	make

feature {NONE} -- Initialization

	make(a_x, a_y, a_width, a_height, a_bordure:INTEGER)
			-- Initialization for `Current'.
		do
			create {TUPLE[width,height,bordure:INTEGER]} dimension
			create {TUPLE[x,y:INTEGER]} position2
			make_attributs
			position.x:=a_x
			position.y:=a_y
			dimension.width:=a_width
			dimension.height:=a_height
			dimension.bordure:=a_bordure
			make_as_mask (dimension.width, dimension.height)
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
	dimension:TUPLE[width,height,bordure:INTEGER_32]

feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end
