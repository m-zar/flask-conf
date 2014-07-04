$app_name        = 'candi'
$www_dir         = '/var/www'
$app_path        = "${www_dir}/${app_name}"
$virtualenv_name = 'venv'
$user            = 'vagrant'

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
  app_path => $app_path,
  user     => $user,
}
class { 'virtualenv':
  app_path        => $app_path,
  virtualenv_name => $virtualenv_name,
  user            => $user,
}
class { 'uwsgi':
  app_path        => $app_path,
  virtualenv_name => $virtualenv_name,
  user            => $user,
}
class { 'nginx':
}
