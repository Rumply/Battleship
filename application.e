note
	description : "Battleship application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED		-- To use `game_library'
	IMG_LIBRARY_SHARED		-- To use `image_file_library'

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			MaListe:LINKED_LIST[STRING_32]
			test:STRING_32
		do
			--| Add your code here
			create MaListe.make
			test:="Hello Eiffel World!%N"
			MaListe.extend(test)
			print (test)
		end

end
