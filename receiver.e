note
	description: "[
				Classe qui fait en sorte que lorsque le jeu est jou� en multijoueur, les
				messages re�u soient re�u, le plus possible, en temps r�el.
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
