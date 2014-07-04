class nginx {
  package { 'nginx':
    ensure   => installed,
    provider => 'apt',
    require  => Exec['apt-update'],
  }
  service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
  }
  file { '/etc/nginx/nginx.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => 'puppet:///modules/nginx/conf.erb',
    notify  => Service['nginx'],
    require => Package['nginx'],
  }
}


