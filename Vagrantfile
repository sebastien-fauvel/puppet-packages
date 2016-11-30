Vagrant.configure('2') do |config|

  config.vm.provision 'shell', path: 'scripts/puppet-install.sh'

  config.vm.provision 'puppet' do |puppet|
    puppet.environment_path = 'spec/puppet/environments'
    puppet.environment = 'default'
    puppet.module_path = 'modules'
  end

  config.vm.provider 'virtualbox' do |v|
    v.gui = (ENV['gui'] == 'true')
    # Soundcard to test audio-related modules
    v.customize ["modifyvm", :id, '--audio', 'null', '--audiocontroller', 'hda']
  end

  config.vm.define 'Ubuntu-15.04' do |vivid|
    vivid.vm.box = 'cargomedia/ubuntu-1504-plain'
    vivid.vm.network :forwarded_port, guest: 22, host: 22201, id: 'ssh'
    # Additional network card to test module network (resource type network::interface)
    vivid.vm.network :private_network, ip: '10.10.20.3', auto_config: false
  end

  config.vm.define 'Debian-8' do |jessie|
    jessie.vm.box = 'cargomedia/debian-8-amd64-plain'
    jessie.vm.network :forwarded_port, guest: 22, host: 22202, id: 'ssh'
    # Additional network card to test module network (resource type network::interface)
    jessie.vm.network :private_network, ip: '10.10.20.4', auto_config: false
  end
end
