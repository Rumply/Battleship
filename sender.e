note
	description: "[
				La classe SENDER fait en sorte que lorsque le jeu est joué en multijoueurs,
				les deux joueurs savent qui a écrit quoi et qui a envoyé quoi.
				]"
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

end
