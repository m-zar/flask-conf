class python {
  package { 'python-setuptools':
    ensure => installed,
  }
  package { 'python-pip':
    ensure  => installed,
    require => Package['python-setuptools'],
  }
  package { 'python-virtualenv':
    ensure  => installed,
    require => Package['python-setuptools', 'python-pip'],
  }
  package { 'python-dev' :
    ensure  => installed,
  }
}
