
require 'sequel'
require 'yaml'

content = File.new("config/databases/mysql.yml").read
settings = YAML::load content
DB = Sequel.connect "#{settings['adapter']}://#{settings['username']}:#{settings['password']}@#{settings['host']}/#{settings['database']}"

