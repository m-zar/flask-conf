class uwsgi ($app_path, $virtualenv_name, $user) {

  exec { 'install uwsgi':
    command => "${app_path}/${virtualenv_name}/bin/pip install uwsgi",
    user    => $user,
    group   => $user,
    require => Exec['virtualenv'],
  }
  exec { 'start uwsgi':
    command => "${app_path}/${virtualenv_name}/bin/uwsgi --socket 127.0.0.1:8080 -w WSGI:app &",
    user    => $user,
    group   => $user,
    cwd     => $app_path,
    require => Exec['virtualenv', 'install uwsgi', 'install flask'],
  }
}

