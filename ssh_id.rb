
module Ssh

	class Id

		def copy_all(hosts)
			hosts.each do |host|
				command = self.generate_copy_command(host)
				exec command
			end
		end

		def show_copy_all(hosts)
			hosts.each do |host|
				command = self.generate_copy_command(host)
				puts command
			end
		end

		protected

			def generate_copy_command(host)
				"ssh-copy-id -i #{host.id_file} #{host.user}@#{host.name}"
			end

	end

end
