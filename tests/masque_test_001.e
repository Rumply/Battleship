note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	MASQUE_TEST_001
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{ELEMENT}.make"
		local
			v_1: detachable ANY
			v_2: ELEMENT
		do
			v_1 := Void

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: NONE): ELEMENT
				do
					create {ELEMENT} Result.make (a_arg1)
				end (Void))
			check attached {ELEMENT} last_object as l_ot1 then
				v_2 := l_ot1
			end
		end

end

