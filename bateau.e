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

	make(a_case_width,a_case_height:INTEGER)
			-- Initialization for `Current'.
		do
			case_width:=a_case_width
			case_height:=a_case_height
			set_as_bateau1
			create position_bateau1.make (4)
			create position_bateau2.make (3)
			create position_bateau3.make (3)
			create position_bateau4.make (2)
			create position_bateau5.make (5)
		end

feature -- Access

	set_bateau(a_id:INTEGER)
		do
			if (a_id=0) then
				set_as_bateau1
			elseif (a_id=1) then
				set_as_bateau2
			elseif (a_id=2) then
				set_as_bateau3
			elseif (a_id=3) then
				set_as_bateau4
			elseif (a_id=4) then
				set_as_bateau5
			end
		end

	get_bateau(a_id:INTEGER):MASQUE
		do
			set_bateau(a_id)
			Result:=image_bateau
		end

	fill_bateau_list(a_id:INTEGER;a_position_list:ARRAYED_LIST[INTEGER])
		do
			if a_id = 0 then
				position_bateau1:=(a_position_list)
			elseif a_id = 1 then
				position_bateau2:=(a_position_list)
			elseif a_id = 2 then
				position_bateau3:=(a_position_list)
			elseif a_id = 3 then
				position_bateau4:=(a_position_list)
			elseif a_id = 4 then
				position_bateau5:=(a_position_list)
			end
		end

	set_as_bateau1
		-- Routine qui impose les attributs de `a_bateau'.
		do
			image_bateau.in_image_pos.x:=0
			image_bateau.in_image_pos.y:=0
			image_bateau.filedimension.width:=380
			image_bateau.filedimension.height:=80
			image_bateau.gamedimension.width:=case_width*4
			image_bateau.gamedimension.height:=case_height
			image_bateau.position.x:=0
			image_bateau.position.y:=0
		end

	set_as_bateau2
		-- Routine qui impose les attributs de `a_bateau'.
		do
			image_bateau.in_image_pos.x:=0
			image_bateau.in_image_pos.y:=80
			image_bateau.filedimension.width:=280
			image_bateau.filedimension.height:=80
			image_bateau.gamedimension.width:=case_width*3
			image_bateau.gamedimension.height:=case_height
			image_bateau.position.x:=0
			image_bateau.position.y:=0
		end

	set_as_bateau3
	-- Routine qui impose les attributs de `a_bateau'.
		do
			image_bateau.in_image_pos.x:=0
			image_bateau.in_image_pos.y:=160
			image_bateau.filedimension.width:=280
			image_bateau.filedimension.height:=80
			image_bateau.gamedimension.width:=case_width*3
			image_bateau.gamedimension.height:=case_height
			image_bateau.position.x:=0
			image_bateau.position.y:=0
		end

	set_as_bateau4
	-- Routine qui impose les attributs de `a_bateau'.
		do
			image_bateau.in_image_pos.x:=0
			image_bateau.in_image_pos.y:=240
			image_bateau.filedimension.width:=180
			image_bateau.filedimension.height:=80
			image_bateau.gamedimension.width:=case_width*2
			image_bateau.gamedimension.height:=case_height
			image_bateau.position.x:=0
			image_bateau.position.y:=0
		end

	set_as_bateau5
	-- Routine qui impose les attributs de `a_bateau'.
		do
			image_bateau.in_image_pos.x:=0
			image_bateau.in_image_pos.y:=320
			image_bateau.filedimension.width:=380
			image_bateau.filedimension.height:=80
			image_bateau.gamedimension.width:=case_width*5
			image_bateau.gamedimension.height:=case_height
			image_bateau.position.x:=0
			image_bateau.position.y:=0
		end

feature -- Access

	case_width,case_height:INTEGER

	position_bateau1:ARRAYED_LIST[INTEGER]
	position_bateau2:ARRAYED_LIST[INTEGER]
	position_bateau3:ARRAYED_LIST[INTEGER]
	position_bateau4:ARRAYED_LIST[INTEGER]
	position_bateau5:ARRAYED_LIST[INTEGER]

feature -- Singleton

	image_bateau: MASQUE
            -- `Result' est un {MASQUE} avec tout les bateaux.
        once
            create Result.make_element ("bateaux.png")
        end

	

end
