note
	description: "Summary description for {COMMAND}."
	author: "Guillaume Hamel-Gagné"
	date: "16 mai 2016"
	revision: "1.2"

class
	COMMAND

feature



	connect(argument:STRING;network:RESEAU)
		-- Routine pour la commande 'connect'. Afin de lancer une connection TCP.
		do
			network.client(argument)
		end

	host(network:RESEAU)
		-- Routine pour la commande 'host'. Afin d'attendre un connection TCP.
		do
			network.host
		end

	msg(argument:STRING;network:RESEAU)
		-- Routine pour la commande 'msg'. Afin d'ajouté un message à envoyé.
		do
			network.client_socket.put_string (argument)
			--network.buffer_send.extend (argument)
		end

	read(network:RESEAU): detachable STRING
		-- Cette fonction retourne le premier élément de la file `buffer_receive'.
		local
			first_item: detachable STRING
		do
			first_item:=network.buffer_receive.item
			network.buffer_receive.remove
			Result:=first_item
		end

end
