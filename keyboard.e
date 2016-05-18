
note
	description: "Summary description for {KEYBOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KEYBOARD

create
	make

feature {NONE}

	make
	    local
	    	a_key_state: GAME_KEY_STATE
		do

		end
feature

	get_key(a_key_state: GAME_KEY_STATE):STRING
		-- Cette fonction permet d'avoir un string de certaine touche correspondante à la touche appuyé.
		local
			l_key:STRING
		do
			l_key:="none"

			if a_key_state.is_a then
				l_key:="a"
			elseif a_key_state.is_b then
				l_key:="b"
			elseif a_key_state.is_c then
				l_key:="c"
			elseif a_key_state.is_d then
				l_key:="d"
			elseif a_key_state.is_e then
				l_key:="e"
			elseif a_key_state.is_f then
				l_key:="f"
			elseif a_key_state.is_g then
				l_key:="g"
			elseif a_key_state.is_h then
				l_key:="h"
			elseif a_key_state.is_i then
				l_key:="i"
			elseif a_key_state.is_j then
				l_key:="j"
			elseif a_key_state.is_k then
				l_key:="k"
			elseif a_key_state.is_l then
				l_key:="l"
			elseif a_key_state.is_m then
				l_key:="m"
			elseif a_key_state.is_n then
				l_key:="n"
			elseif a_key_state.is_o then
				l_key:="o"
			elseif a_key_state.is_p then
				l_key:="p"
			elseif a_key_state.is_q then
				l_key:="q"
			elseif a_key_state.is_r then
				l_key:="r"
			elseif a_key_state.is_s then
				l_key:="s"
			elseif a_key_state.is_t then
				l_key:="t"
			elseif a_key_state.is_u then
				l_key:="u"
			elseif a_key_state.is_v then
				l_key:="v"
			elseif a_key_state.is_w then
				l_key:="w"
			elseif a_key_state.is_x then
				l_key:="x"
			elseif a_key_state.is_y then
				l_key:="y"
			elseif a_key_state.is_z then
				l_key:="z"
			elseif a_key_state.is_0 then
				l_key:="0"
			elseif a_key_state.is_1 then
				l_key:="1"
			elseif a_key_state.is_2 then
				l_key:="2"
			elseif a_key_state.is_3 then
				l_key:="3"
			elseif a_key_state.is_4 then
				l_key:="4"
			elseif a_key_state.is_5 then
				l_key:="5"
			elseif a_key_state.is_6 then
				l_key:="6"
			elseif a_key_state.is_7 then
				l_key:="7"
			elseif a_key_state.is_8 then
				l_key:="8"
			elseif a_key_state.is_9 then
				l_key:="9"
			elseif a_key_state.is_space then
				l_key:=" "
			elseif a_key_state.is_period then
				l_key:="."
			elseif a_key_state.is_comma then
				l_key:=","
			elseif a_key_state.is_escape then
				l_key:="esc"
			elseif a_key_state.is_down then
				l_key:="down"
			elseif a_key_state.is_up then
				l_key:="up"
			elseif a_key_state.is_right then
				l_key:="right"
			elseif a_key_state.is_left then
				l_key:="left"
			elseif a_key_state.is_backspace then
				l_key:="backspace"
			elseif a_key_state.is_return then
				l_key:="return"
			end

			Result:=l_key
		end



end
