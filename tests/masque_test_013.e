note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_013
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{STRING_32}.make_from_c"
		local
			v_442: POINTER
			v_443: attached STRING_32
		do
			v_442 := default_pointer

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: POINTER): attached STRING_32
				do
					create {attached STRING_32} Result.make_from_c (a_arg1)
				end (v_442))
			check attached {attached STRING_32} last_object as l_ot1 then
				v_443 := l_ot1
			end
		end

end

