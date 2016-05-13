note
	description: "[
				Classe qui fait en sorte que lorsque le jeu est joué en multijoueur, les
				messages envoyés soient envoyés, le plus possible, en temps réel.
				]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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
			IP:=""

			create server_socket.make_empty
			create client_socket.make_empty
			make_thread
			must_stop:=false
		end

feature -- Access

	stop_thread
		do
			must_stop:=true
		end

	host
		local
			l_server_socket:NETWORK_STREAM_SOCKET
			l_client_socket: detachable NETWORK_STREAM_SOCKET
		do
			create l_server_socket.make_server_by_port (port)
			l_server_socket.listen (1)
			l_server_socket.accept

			l_client_socket:=l_server_socket.accepted
			if attached l_client_socket as lla_socket then
				client_socket:=lla_socket
			end
		end

	client
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			l_socket:NETWORK_STREAM_SOCKET

			l_socket_UDP:NETWORK_STREAM_SOCKET
		do
			create l_addr_factory
			--l_address:=l_addr_factory.create_from_address ("localhost")


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

	server_socket:NETWORK_STREAM_SOCKET
	client_socket: NETWORK_STREAM_SOCKET
	IP:STRING
	port:INTEGER

feature {NONE} -- Implementation
	must_stop:BOOLEAN

end
