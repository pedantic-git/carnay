class {'apt':
	always_apt_update => true,
}

package {['apache2', 'build-essential', 'curl', 'git', 'libmysqlclient-dev', 'libsqlite3-dev', 
		  'mysql-server', 'nodejs']:
  	provider => apt,
  	ensure => latest,
	require => Class['apt'];
}

package {'ruby1.9.3':
  	provider => apt,
  	ensure => latest,
	require => Class['apt'];
}

package {'rails':
	provider => gem,
	ensure => "4.0.0.beta1",
	require => [Package['ruby1.9.3'], Package['build-essential']];
}
