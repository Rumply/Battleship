note
	description: "Summary description for {MESSAGE_CONSOLE_OS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MESSAGE_CONSOLE_OS

feature {NONE} -- Implementation

	clear_string:STRING
		once
			Result := "clear"
		end

end
