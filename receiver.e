note
	description: "[
				Classe qui fait en sorte que lorsque le jeu est joué en multijoueur, les
				messages reçu soient reçu, le plus possible, en temps réel.
				]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RECEIVER

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do

		end

feature {RECEIVER} -- Access

	receiver_reseau: RESEAU
			-- `receiver_reseau'
		attribute check False then end end --| Remove line when `receiver_reseau' is initialized in creation procedure.

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
