class httpsetup {
        service { 'httpd':
          ensure  => running,
          enable  => true,
	  require => [
	  Package['httpd'],
	  ],
        }

	package { 'httpd':
	  ensure => present,
	} ->	# Command arrow to execute below command
	file { "/var/www/html":	
	  ensure => "directory",
	  owner  => "apache",
	  group  => "apache",
	  mode   => 750,
	} -> 
	file { '/var/www/html/index.html':	# Create index file
	  ensure  => file,
	  content => "Puppet is Great!",
	  mode    => '0644',
	}
}
