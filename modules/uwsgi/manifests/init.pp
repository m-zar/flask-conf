class uwsgi ($app_path, $virtualenv_name) {
  
  exec { 'install uwsgi' :
    command => "${app_path}/${virtualenv_name}/bin/pip install uwsgi",
    user    => 'vagrant',
    require => Exec['virtualenv'],
  }
}
  
