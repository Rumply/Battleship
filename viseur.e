note
	description: "Summary description for {VISEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VISEUR

create
	make

feature {NONE}

	make(case_dimension:TUPLE[width,height:INTEGER])
		do

			create surface.make_element ("vise.png")
			surface.gamedimension.width:=case_dimension.width
			surface.gamedimension.height:=case_dimension.height
		end

	initialize_pointer
		do
			surface.in_image_pos.x:=0
			surface.in_image_pos.y:=0
			surface.filedimension.width:=surface.width
			surface.filedimension.height:=surface.height
			surface.position.x:=0
			surface.position.y:=0
		end

feature -- Teste

	change_image(a_image:MASQUE)
		do
			surface:=a_image
		end

feature -- Access

	surface:MASQUE
end
