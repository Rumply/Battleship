note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_GRILLE

inherit
	EQA_TEST_SET
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature -- Test routines

	initialize_grille(a_grille:GRILLE)
		-- Routine qui initialise les attributs de la grille.
		do
			a_grille.position.x:=0
			a_grille.position.y:=0
			a_grille.dimension.width:=800
			a_grille.dimension.height:=800
			a_grille.dimension.bordure:=10
			a_grille.selected_pos.x:=a_grille.position.x
			a_grille.selected_pos.y:=a_grille.position.y
		end

	test_make
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			grille:GRILLE
			l_width,l_height,l_bordure:INTEGER
		do
			game_library.enable_video

			l_width:=300
			l_height:=400
			l_bordure:=10

			create grille.make (l_width, l_height, l_bordure)

			assert ("Initiate bordure :", grille.dimension.bordure = l_bordure)
			assert ("Initiate width :", grille.dimension.width = l_width)
			assert ("Initiate height :", grille.dimension.height = l_height)

			game_library.quit_library
		end

	test_is_on
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			grille:GRILLE
			l_width,l_height,l_bordure:INTEGER
		do
			game_library.enable_video

			l_width:=300
			l_height:=400
			l_bordure:=10

			create grille.make (l_width, l_height, l_bordure)

			initialize_grille(grille)

			grille.is_on (1, 1)
			assert ("Initiate bordure :", grille.hover)
			grille.is_on ((grille.dimension.width + 1), 1)
			assert ("Initiate bordure :", not grille.hover)

			game_library.quit_library
		end

	test_get_index_from_mousePos
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			grille:GRILLE
			l_width,l_height,l_bordure:INTEGER
		do
			game_library.enable_video

			l_width:=300
			l_height:=400
			l_bordure:=10

			create grille.make (l_width, l_height, l_bordure)

			initialize_grille(grille)

			grille.get_index_from_mousePos (1, 1)
			assert ("Got the right index :", grille.index = 1)

			game_library.quit_library
		end

	test_is_position_bateau_valide
			-- New test routine
		note
			testing:  "execution/isolated"
		local
			grille:GRILLE
			l_width,l_height,l_bordure:INTEGER
		do
			game_library.enable_video

			l_width:=300
			l_height:=400
			l_bordure:=10

			create grille.make (l_width, l_height, l_bordure)

			initialize_grille(grille)

			grille.get_index_from_mousepos (1, 1)
			grille.is_position_bateau_valide (grille.case_dimension.width, grille.case_dimension.height, false)
			assert ("Bateau case 1x1 première colonne :", grille.case_valide)
			grille.get_index_from_mousepos ((grille.dimension.width-1), 1)
			grille.is_position_bateau_valide ((2*(grille.case_dimension.width)), grille.case_dimension.height, false)
			assert ("Bateau case 2x1 dernière colonne :", not grille.case_valide)

			game_library.quit_library
		end
end


