note
	description: "Classe o� les options du jeu seront cr�es, Solo vs Multi par exemple."
	author: "Guillaume Hamel-Gagn�"
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_OPTION

create
	make_available

feature

	make_available
		local
			content:STRING
		do
--			fichier_option:="option.txt"
--			create fichier_option.make_create_read_write (fichier_option)
--			fichier_option.read_stream (fichier_option.count)
--			content:=fichier_option.retrieved

		end
feature -- Constants

--	fichier_option:PLAIN_TEXT_FILE

end
