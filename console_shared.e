note
	description: "Summary description for {CONSOLE_SHARED}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CONSOLE_SHARED

feature -- Access

	console:MESSAGE_CONSOLE
			-- The main controller of the game library
		once
			create Result.make
		end

end
