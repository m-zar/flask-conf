class flask ($app_name, $app_path, $user) {
  $app_dir = "${app_path}/app"
  file { 'app_path_tree':
    path    => $app_path,
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => '0755',
    require => File['www_dir'],
  }
  file { 'server_entry_point':
    path    => "${app_path}/WSGI.py",
    ensure  => present,
    mode    => 0655,
    owner   => $user,
    group   => $user,
    require => File['app_path_tree'],
    source  => 'puppet:///modules/flask/WSGI.py.erb',
  }
  file { 'application_dir':
    path    => $app_dir,
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => 0755,
    require => File['app_path_tree'],
  }
  file { '__init__.py':
    path    => "$app_dir/__init__.py",
    ensure  => present,
    owner   => $user,
    group   => $user,
    mode    => 0655,
    require => File['application_dir'],
    source  => 'puppet:///modules/flask/hello_app.erb',
  }
  exec { 'install flask' :
    command => "${app_path}/${virtualenv_name}/bin/pip install flask",
    user    => $user,
    group   => $user,
    require => Exec['virtualenv'],
  }
}
