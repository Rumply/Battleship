note
	description: "Summary description for {BOUTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOUTON

inherit
	ELEMENT

	ELEMENT

	ELEMENT

	ELEMENT

create
	make_bouton

feature {NONE}

	make_bouton(a_filename:READABLE_STRING_GENERAL;a_text:STRING)
	do
		make_surface(a_filename)
		--set_text(a_text)
	end

feature --Access

--	set_text(a_text:STRING)
--	local
--		l_font:TEXT_FONT
--		l_color:GAME_COLOR_READABLE
--	do
--		create l_font.make (".\ressource\font\ArmyStamp.ttf", 20)
--		create l_color.make_rgb (0, 0, 0)


--		make_text("SALUT",l_font,l_color)
--		--text.text:=a_text
--		--text.font:=l_font
--	end

end
