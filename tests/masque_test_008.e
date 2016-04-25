note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_008
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{STRING_8}.make_from_c"
		local
			v_178: POINTER
			v_179: attached STRING_8
		do
			v_178 := default_pointer

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: POINTER): attached STRING_8
				do
					create {attached STRING_8} Result.make_from_c (a_arg1)
				end (v_178))
			check attached {attached STRING_8} last_object as l_ot1 then
				v_179 := l_ot1
			end
		end

end

