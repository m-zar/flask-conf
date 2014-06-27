class virtualenv ($app_path, $virtualenv_name) {
  exec { 'virtualenv' :
    command => "/usr/bin/virtualenv ${virtualenv_name}",
    cwd     => $app_path,
    creates => "${app_path}/${virtualenv_name}",
    user    => 'vagrant',
    require => Package['python-dev'],
  }

}
