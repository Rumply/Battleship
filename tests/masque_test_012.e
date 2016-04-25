note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_012
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{IMMUTABLE_STRING_32}.make"
		local
			v_369: INTEGER_32
			v_370: attached IMMUTABLE_STRING_32
		do
			v_369 := {INTEGER_32} -6

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: INTEGER_32): attached IMMUTABLE_STRING_32
				do
					create {attached IMMUTABLE_STRING_32} Result.make (a_arg1)
				end (v_369))
			check attached {attached IMMUTABLE_STRING_32} last_object as l_ot1 then
				v_370 := l_ot1
			end
		end

end

