
module Ssh

	class Host

		attr_reader :alias, :name, :user, :id_file

		def initialize(args = {})
			@alias = args.fetch(:alias)
			@name = args.fetch(:name)
			@user = args.fetch(:user)
			@id_file = args.fetch(:id_file)
		end

		def to_h
			{
				alias: self.alias,
				name: self.name,
				user: self.user,
				id_file: self.id_file
			}
		end

	end

end
