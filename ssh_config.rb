
module Ssh

	class Config

		def initialize(args = {})
			@user = args.fetch(:user, "anthony")
			@file_path = args.fetch(:config_path, "/home/#{@user}/.ssh/config")
		end

		def hosts
			self.class.get_hosts(self.file_path)
		end

		protected
			attr_reader :file_path

		private

			def self.get_hosts(file_path)
				hosts_data = self.parser::hosts_data(file_path)
				self.instantiate_hosts(hosts_data)
			end

			def self.instantiate_hosts(hosts_data)
				hosts_data.map do |host_data|
					Ssh::Host.new(host_data)
				end
			end

			def self.parser
				Ssh::Parser
			end

	end

end
