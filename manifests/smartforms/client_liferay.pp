# myoffice/smartforms/client_liferay.pp

class myoffice::smartforms::client_liferay::get {

  package { 'wget':
    ensure => present,
  }

  package { 'unzip':
    ensure => present,
  }

  exec { 'wget-liferay':
    command => "/usr/bin/wget --output-document=/home/${web_user}/liferay.zip ${lr_dl}", 
    creates => "/home/${web_user}/liferay.zip",
    group   => "${web_user}",
    user    => "${web_user}",
    require => Package['wget'],
  }

  exec { 'unzip-liferay':
    command => "/usr/bin/unzip -o /home/${web_user}/liferay.zip",
    user    => "${web_user}",
    group   => "${web_user}",
    cwd     => "/home/${web_user}/",
    creates => "${lr_root}",
    require => Package['unzip'],
  }

  file { "/home/${web_user}/liferay-portal":
    ensure => 'link',
    target => "${lr_root}",
    owner  => "${web_user}",
    group  => "${web_user}",
  }

  file { "/home/${web_user}/liferay-portal/tomcat":
    ensure => 'link',
    target => "${tc_root}",
    owner  => "${web_user}",
    group  => "${web_user}",
  }

  Exec['unzip-liferay'] -> File["/home/${web_user}/liferay-portal"] -> File["/home/${web_user}/liferay-portal/tomcat"]
}

class myoffice::smartforms::client_liferay::configure {
  file { "/home/${web_user}/liferay-portal/tomcat/webapps/ROOT/WEB-INF/classes/portal-ext.properties":
    owner   => "${web_user}",
    group   => "${web_user}",
    content => template('myoffice/portal-ext.erb')
  }
}

class myoffice::smartforms::client_liferay(
  $lr_dl    = $myoffice::smartforms::client_params::lr_dl,
  $lr_root  = $myoffice::smartforms::client_params::lr_root,
  $web_user = $myoffice::smartforms::client_params::web_user,
) inherits myoffice::smartforms::client_params {

  class { 'myoffice::smartforms::client_liferay::get': }
  class { 'myoffice::smartforms::client_liferay::configure': }

  Class['myoffice::smartforms::client_liferay::get'] -> Class['myoffice::smartforms::client_liferay::configure']

}
