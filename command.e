note
	description: "Summary description for {COMMAND}."
	author: "Guillaume Hamel-Gagné"
	date: "16 mai 2016"
	revision: "1.2"

class
	COMMAND

feature

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

	connect(argument:STRING;network:RESEAU)
		-- Routine pour la commande 'connect'. Afin de lancer une connection TCP.
		local
			ip:ARRAY [NATURAL_8]
		do
			ip:=ip_parse(argument)
			network.client(ip)
		end

	host(network:RESEAU)
		-- Routine pour la commande 'host'. Afin d'attendre un connection TCP.
		do
			network.host
		end

	msg(argument:STRING;network:RESEAU)
		-- Routine pour la commande 'msg'. Afin d'ajouté un message à envoyé.
		do
			network.buffer_send.extend (argument)
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
