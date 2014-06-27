class python {
  exec { 'apt-update':
    command     => '/usr/bin/apt-get update',
    #refreshonly => true,
  }
  package { 'python-setuptools':
    ensure => installed,
  }
  package { 'python-pip':
    ensure  => installed,
    require => Package['python-setuptools'],
  }
  package { 'python-virtualenv':
    ensure  => installed,
    require => [Exec['apt-update'], Package['python-setuptools', 'python-pip']],
  }
  package { 'python-dev' :
    ensure  => installed,
    require => Exec['apt-update'],
  }
}
