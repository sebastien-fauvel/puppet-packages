class vagrant {

  $version = '1.8.4'
  $url = "https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_x86_64.deb"

  require 'apt'

  helper::script { 'install vagrant':
    content     => template("${module_name}/install.sh"),
    unless      => "vagrant --version | grep '^Vagrant ${version}$'",
    environment => ['HOME=/tmp'],   # Vagrant needs $HOME (https://github.com/mitchellh/vagrant/issues/2215)
    require => Class['apt::update'],
  }
}
