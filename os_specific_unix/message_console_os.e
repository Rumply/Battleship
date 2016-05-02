note
	description: "Summary description for {MESSAGE_CONSOLE_OS}."
	author: "Guillaume Hamer-Gagné"
	date: "26 avril 2016"
	revision: "1.0"

deferred class
	MESSAGE_CONSOLE_OS

feature {NONE} -- Implementation

	clear_string:STRING
		once
			Result := "clear"
		end

end
