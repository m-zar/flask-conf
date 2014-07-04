class uwsgi ($app_path, $virtualenv_name) {

  exec { 'install uwsgi' :
    command => "${app_path}/${virtualenv_name}/bin/pip install uwsgi",
    user    => 'vagrant',
    require => Exec['virtualenv'],
  }
  exec { 'start uwsgi':
    command => "${app_path}/${virtualenv_name}/bin/uwsgi --socket 127.0.0.1:8080 -w WSGI:app &",
    user    => 'vagrant',
    cwd     => $app_path,
    require => Exec['virtualenv', 'install uwsgi', 'install flask'],
  }
}

