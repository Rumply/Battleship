note
	description: "Classe ou est-ce que les bateaux seront déssiné. BATEAU est un enfant de MASQUE."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BATEAU

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do

		end

feature {BATEAU} -- Access

	bateau: ELEMENT
			-- `bateau'
		attribute check False then end end --| Remove line when `bateau' is initialized in creation procedure.

feature -- Access

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
