note
	description: "[
				Classe qui fait en sorte que lorsque le jeu est joué en multijoueur, les
				messages envoyés soient envoyés, le plus possible, en temps réel.
				]"
	author: "Guillaume Hamel-Gagné"
	date: "16 mai 2016"
	revision: "1.2"

class
	RESEAU

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {NONE} -- Initialization

	make
		do
			port:=45500
			create IP.make_empty

			create server_socket.make_empty
			create client_socket.make_empty

			create buffer_send.make (0)
			create buffer_receive.make (0)

			make_thread
			must_stop:=false
			buffer_receive_empty:=true
			connecting:=false
			listening:=false
			sending:=false
			hosting:=false
		end

feature -- Utility

	ip_parse(a_ip:STRING): ARRAY [NATURAL_8]
		-- Cette fonction transforme un `a_ip' en array afin de pouvoir l'utiliser avec la librairie 'net'
		local
			l_ip:ARRAY [NATURAL_8]
			list_temp:LIST[STRING_8]
			l_valide:BOOLEAN
			l_count:INTEGER
		do
			create l_ip.make_empty

			l_count:=1
			l_valide:=true
			list_temp:=a_ip.split ('.')
			if list_temp.count = 4 then
				l_ip.grow (4)
				across list_temp as element loop
					if element.item.is_natural_8 then
						l_ip.put (element.item.to_natural_8, l_count)
						l_count:= l_count + 1
					end
				end
			end
			Result:=l_ip
		end

feature -- Access

	stop_thread
		do
			must_stop:=true
		end

	host
		do
			if not hosting then
				create server_socket.make_server_by_port (port)
				hosting:=true
			end
		end

	client(ip_string:STRING)
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			l_ip:ARRAY[NATURAL_8]
		do
			create l_addr_factory

			if ip_string.is_equal ("localhost") then
				if attached l_addr_factory.create_from_name ("localhost") as l_ip2 then
					l_address:=l_ip2
					create client_socket.make_client_by_address_and_port (l_address,port)
				end
			else
				l_ip:=ip_parse(ip_string)
				create IP.make_from_array (l_ip)
				if attached l_addr_factory.create_from_address (l_ip) as l_ip2 then
				l_address:=l_ip2
				create client_socket.make_client_by_address_and_port (l_address,port)
			end
			end


			--l_addr_factory.create_from_address (a_ip)

			connecting:=true
		end



feature {NONE} -- Thread methods

	execute
		do
			from
			until
				must_stop
			loop
				if listening then
					from
					until
						not listening
					loop
						from
						until
							client_socket.is_readable
						loop
							client_socket.read_line
							buffer_receive.put (client_socket.last_string)
						end
						sleep(1000)
					end
				end
				if hosting then
					server_socket.listen (1)
					server_socket.accept
					if attached server_socket.accepted as l_socket then
						client_socket:=l_socket
						if attached client_socket as lla_socket then
							client_socket:=lla_socket
							listening:=true
							connecting:=true
						end
					end
					hosting:=false
				end
				if connecting then
					client_socket.connect
					connecting:=false
					listening:=true
					sending:=true
				end

				if closed then
					client_socket.close
					buffer_send.wipe_out
					connecting:=false
					listening:=false
					sending:=false
					closed:=false
					hosting:=false
				end
				sleep (1000)
			end
		end

feature -- Access

	closed:BOOLEAN
	server_socket:NETWORK_STREAM_SOCKET
	client_socket: NETWORK_STREAM_SOCKET
	IP:ARRAY[NATURAL_8]
	port:INTEGER
	buffer_send,buffer_receive:ARRAYED_QUEUE[STRING]
	connecting,listening,sending:BOOLEAN
	buffer_receive_empty:BOOLEAN
	buffer_send_empty:BOOLEAN
	hosting:BOOLEAN

feature {NONE} -- Implementation
	must_stop:BOOLEAN

end
