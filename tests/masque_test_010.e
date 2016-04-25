note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_010
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{IMMUTABLE_STRING_32}.make_filled"
		local
			v_245: CHARACTER_32
			v_246: INTEGER_32
			v_247: attached IMMUTABLE_STRING_32
		do
			v_245 := {CHARACTER_32} '9'
			v_246 := {INTEGER_32} -1

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: CHARACTER_32; a_arg2: INTEGER_32): attached IMMUTABLE_STRING_32
				do
					create {attached IMMUTABLE_STRING_32} Result.make_filled (a_arg1, a_arg2)
				end (v_245, v_246))
			check attached {attached IMMUTABLE_STRING_32} last_object as l_ot1 then
				v_247 := l_ot1
			end
		end

end

