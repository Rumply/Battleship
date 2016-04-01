note
	description: "Summary description for {BOUTON}."
	author: "Guillaume Hamel Gagné"
	date: "$Date$"
	revision: "$Revision$"

class
	BOUTON

inherit
	ELEMENT
		rename
			make as make_element
		end
	TEXT_SURFACE_BLENDED
		rename
			make as make_text_surface
		select
			make_surface
		end

create
	make_bouton

feature {NONE}

	make_bouton(a_filename:READABLE_STRING_GENERAL;a_text:STRING)
	local
		l_font:TEXT_FONT
		l_black:GAME_COLOR
	do
		make_element(a_filename)

		create l_black.make_rgb (0,0,0)

		create l_font.make ("./ressource/font/ArmyStamp.ttf", 50)
		if l_font.is_openable then
			l_font.open
		end

		make_text_surface (a_text, l_font, l_black)
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
