load './ssh.rb'

namespace :ssh do

	desc "Adds a specified ssh key to the specified servers"

	task :copy_all, [:config_path] do |_, args|
		args = args.to_h
		ssh_config = Ssh::Config.new(args)
		ssh_id = Ssh::Id.new
		ssh_id.copy_all(ssh_config.hosts)
	end

end
