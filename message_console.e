note
	description: ""
	author: "Guillaume Hamel-Gagné"
	date: "3 mai 2016"
	revision: "1.0"

class
	MESSAGE_CONSOLE

inherit
	THREAD
	rename
		make as make_thread
	end
	MESSAGE_CONSOLE_OS

create
	make

feature {NONE} -- Initialization

	make
		do
			make_thread
			must_stop:=false
		end

feature -- Access

	stop_thread
		do
			must_stop:=true
		end

	write_new_line(a_chaine:STRING)
		require
			a_chaine_is_valide : not a_chaine.is_empty
		do
			io.put_string (a_chaine)
			io.new_line
		end

	clear
		local
			l_env:EXECUTION_ENVIRONMENT
		do
			create l_env
			l_env.system (clear_string)
		end

feature {NONE} -- Thread methods

	execute
		do
			from
			until
				must_stop
			loop

			end
		end

feature {NONE} -- Implementation
	must_stop:BOOLEAN

end
