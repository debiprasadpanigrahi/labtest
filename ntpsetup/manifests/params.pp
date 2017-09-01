##
class ntpsetup::params (
 $server1 = 'ntpserver1.example.com',
# $server2 = 'ntpserver2.example.com'
) {
 service { 'ntpd':
  ensure  => running,
  enable  => "true",
  require => Package['ntp'];
 }

 package { 'ntp':
   ensure => present,
   before => Service['ntpd'];
 }

 file {'/etc/ntp.conf':
   ensure => present,
   content => template ('ntpsetup/ntp.conf.erb');
   }
         
}
