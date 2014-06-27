class flask ($app_name, $app_path) {
  $app_dir = "${app_path}/app"
  file { 'app_path_tree' :
    path    => $app_path,
    ensure  => directory,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0755',
    require => File['www_dir'],
  }
  file { 'server_entry_point' :
    path    => "${app_path}/WSGI.py",
    ensure  => present,
    mode    => 644,
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['app_path_tree'],
  }
  file { 'application_dir' :
    path    => $app_dir,
    ensure  => directory,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => 755,
    require => File['app_path_tree'],
  }
}
