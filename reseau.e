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

	client(a_ip:ARRAY[NATURAL_8])
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
		do
			create IP.make_from_array (a_ip)
			create l_addr_factory
			--l_addr_factory.create_from_address (a_ip)
			if attached l_addr_factory.create_from_address (a_ip) as l_ip then
				l_address:=l_ip
				create client_socket.make_client_by_address_and_port (l_address,port)
			end
			connecting:=true
		end

feature {NONE} -- Thread methods

	execute
		local
			l_count:INTEGER
		do
			from
			until
				must_stop
			loop
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
				elseif listening then
					if client_socket.is_readable then
						client_socket.read_line
						buffer_receive.put (client_socket.last_string)
					end
				elseif sending then
					if buffer_send.count > 0 then
						from
						until buffer_send.is_empty
						loop
							if not client_socket.is_closed then
								client_socket.put_string (buffer_send.item)
								buffer_send.remove
							end
						end
						buffer_send_empty:=true
					end
				elseif closed then
					client_socket.close
					buffer_send.wipe_out
					connecting:=false
					listening:=false
					sending:=false
					closed:=false
					hosting:=false
				end
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
