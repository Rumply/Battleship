note
	description: "Classe ou l'outil de discussion instantan�e est cr�� et utilis� en r�seau."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHAT

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do

		end

feature {CHAT} -- Access

	chat_receiver: RECEIVER
			-- `chat_receiver'
		attribute check False then end end --| Remove line when `chat_receiver' is initialized in creation procedure.

feature {CHAT} -- Access

	chat_sender: SENDER
			-- `chat_sender'
		attribute check False then end end --| Remove line when `chat_sender' is initialized in creation procedure.

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