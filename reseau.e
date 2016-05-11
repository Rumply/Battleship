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
	CONSOLE_SHARED

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			port:=45500
			IP:=""

			create server_socket.make_empty
			create client_socket.make_empty
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

feature -- Access

	server_socket:NETWORK_STREAM_SOCKET
	client_socket: NETWORK_STREAM_SOCKET
	IP:STRING
	port:INTEGER


end
