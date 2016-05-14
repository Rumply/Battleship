note
	description: "Summary description for {COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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

	connect(argument:STRING)
		-- Routine pour la commande 'connect'. Afin de lancer une connection TCP.
		local
			ip:ARRAY [NATURAL_8]
		do
			ip:=ip_parse(argument)

		end

	host
		-- Routine pour la commande 'command'. Afin d'attendre un connection TCP.
		do

		end

end
