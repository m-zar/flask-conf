class virtualenv ($app_path, $virtualenv_name, $user) {
  exec { 'virtualenv' :
    command => "/usr/bin/virtualenv ${virtualenv_name}",
    cwd     => $app_path,
    creates => "${app_path}/${virtualenv_name}",
    user    => $user,
    group   => $user,
    require => Package['python-dev'],
  }

}
