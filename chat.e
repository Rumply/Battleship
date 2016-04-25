note
	description: "Classe ou l'outil de discussion instantanée est créé et utilisé en réseau."
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

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end
