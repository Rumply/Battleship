note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_007
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{ELEMENT}.make"
		local
			v_158: CHARACTER_32
			v_159: INTEGER_32
			v_160: attached IMMUTABLE_STRING_32
			v_161: ELEMENT
		do
			v_158 := {CHARACTER_32} '2'
			v_159 := {INTEGER_32} 3
			execute_safe (agent (a_arg1: CHARACTER_32; a_arg2: INTEGER_32): attached IMMUTABLE_STRING_32
				do
					create {attached IMMUTABLE_STRING_32} Result.make_filled (a_arg1, a_arg2)
				end (v_158, v_159))
			check attached {attached IMMUTABLE_STRING_32} last_object as l_ot1 then
				v_160 := l_ot1
			end

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: attached IMMUTABLE_STRING_32): ELEMENT
				do
					create {ELEMENT} Result.make (a_arg1)
				end (v_160))
			check attached {ELEMENT} last_object as l_ot2 then
				v_161 := l_ot2
			end
		end

end

