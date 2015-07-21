VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/scripts/setup.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    NOUSSetup.configure(config, YAML::load(File.read(path + '/Config.yaml')))
end
