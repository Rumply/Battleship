note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_009
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{STRING_8}.make_from_c_pointer"
		local
			v_228: POINTER
			v_229: attached STRING_8
		do
			v_228 := default_pointer

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: POINTER): attached STRING_8
				do
					create {attached STRING_8} Result.make_from_c_pointer (a_arg1)
				end (v_228))
			check attached {attached STRING_8} last_object as l_ot1 then
				v_229 := l_ot1
			end
		end

end

