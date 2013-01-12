# myoffice/smartforms/client_liferay.pp

class myoffice::smartforms::client_liferay::get {

  package { 'wget':
    ensure => present,
  }

  package { 'unzip':
    ensure => present,
  }

  exec { 'wget-liferay':
    command => "/usr/bin/wget --output-document=/home/liferay/liferay.zip ${lr_dl}", 
    creates => '/home/liferay/liferay.zip',
    group   => 'liferay',
    user    => 'liferay',
    require => Package['wget'],
  }

  exec { 'unzip-liferay':
    command => '/usr/bin/unzip -o /home/liferay/liferay.zip',
    user    => 'liferay',
    group   => 'liferay',
    cwd     => '/home/liferay/',
    creates => "${lr_root}",
    require => Package['unzip'],
  }
}

class myoffice::smartforms::client_liferay(
  $lr_dl   = $myoffice::smartforms::client_params::lr_dl,
  $lr_root = $myoffice::smartforms::client_params::lr_root,
) inherits myoffice::smartforms::client_params {

  class { 'myoffice::smartforms::client_liferay::get': }

}
