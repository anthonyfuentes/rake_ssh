
module Ssh

	module Parser

		def self.hosts_data(file_path)
			text = self.file_text(file_path)
			split_text = text.split(/host\ /i)
			filtered_text = self.filter_elements(split_text)
			self.parse_hosts_data(filtered_text)
		end

		private

			def self.file_text(file_path)
				File.read(file_path)
			end

			def self.filter_elements(text_segments)
				text_segments.select do |segment|
					segment != "\n"
				end
			end

			def self.parse_hosts_data(hosts_data)
				hosts_data.map do |host_data|
					self.parse_host_data(host_data)
				end
			end

			def self.parse_host_data(host_data)
				split_data = host_data.split(/\n/)
				{
					alias: self.get_alias(split_data),
					name: self.get_name(split_data),
					user: self.get_user(split_data),
					id_file: self.get_id_file(split_data)
				}
			end

			def self.get_alias(host_data)
				host_data[0]
			end

			def self.get_name(host_data)
				host_data.each do |line|
					if line =~ /^\tHostName\ /
						return line.gsub(/\tHostName\ /, "")
					end
				end
			end

			def self.get_user(host_data)
				host_data.each do |line|
					if line =~ /^\tUser\ /
						return line.gsub(/\tUser\ /, "")
					end
				end
			end

			def self.get_id_file(host_data)
				host_data.each do |line|
					if line =~ /^\tIdentityFile\ /
						return line.gsub(/\tIdentityFile\ /, "")
					end
				end
			end

	end

end
