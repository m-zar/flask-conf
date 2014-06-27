$app_name        = 'candi'
$www_dir         = '/var/www'
$app_path        = "${www_dir}/${app_name}"
$virtualenv_name = 'venv'

include python
file { 'www_dir' :
  path   => $www_dir,
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}
class { 'flask':
  app_name => $app_name,
  app_path  => $app_path,
}
class { 'virtualenv':
  app_path        => $app_path,
  virtualenv_name => $virtualenv_name,
}
class { 'uwsgi':
  app_path        => $app_path,
  virtualenv_name => $virtualenv_name,
}
