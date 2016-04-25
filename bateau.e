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
		attribute
			check False then
			end
		end --| Remove line when `bateau' is initialized in creation procedure.

feature -- Access

	

feature {NONE} -- Implementation

end
