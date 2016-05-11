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
			create my_mutex.make
			message:=""
			make_thread
			must_stop:=false
		end

feature -- Access

	stop_thread
		do
			must_stop:=true
		end

	read_line:STRING_8
		local
			input:STRING_8
		do
			io.read_line
			input:=io.last_string

			if my_mutex.try_lock then
				my_mutex.lock
				message:=input
				my_mutex.unlock
			end


			Result:=input
		end

	manage_command(command:LIST[STRING_8])
		do
			command.at (1).remove (1)
			if command.at (1) = "Test" then
				write_new_line ("Still here")
			end
		end

	write_new_line(a_chaine:STRING)
		require
			a_chaine_is_valide : not a_chaine.is_empty
		do
			io.put_string (a_chaine)
			io.new_line
		end

	write(a_chaine:STRING)
		require
			a_chaine_is_valide : not a_chaine.is_empty
		do
			io.put_string (a_chaine)
		end

	clear
		local
			l_env:EXECUTION_ENVIRONMENT
		do
			create l_env
			l_env.system (clear_string)
		end

	close
		local
			l_env:EXECUTION_ENVIRONMENT
		do
			create l_env
			l_env.system ("EXIT")
		end




	my_mutex:MUTEX

	message:STRING

feature {NONE} -- Thread methods

	execute
		do
			from
			until
				must_stop
			loop
				sleep (100)
				if my_mutex.try_lock then
					my_mutex.lock
					if ((message.at (1)) = '/') and (message.has (' ')) then
						manage_command(message.split (' '))
					end
					my_mutex.unlock
				end
			end

		end

feature {NONE} -- Implementation
	must_stop:BOOLEAN



end
