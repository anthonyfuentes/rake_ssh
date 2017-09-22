
module Ssh

	class Id

		def copy_all(hosts)
			hosts.each do |host|
				command = "ssh-copy-id #{host.id_file} #{host.user}@#{host.name}"
				exec command
			end
		end

	end

end
