note
	description: "Summary description for {SENDER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SENDER

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			
		end

feature {SENDER} -- Access

	sender_reseau: RESEAU
			-- `sender_reseau'
		attribute check False then end end --| Remove line when `sender_reseau' is initialized in creation procedure.

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
