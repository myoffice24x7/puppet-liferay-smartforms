# myoffice/smartforms/client_liferay.pp

class myoffice::smartforms::client_liferay::get {

  package { 'wget':
    ensure => present,
  }

  package { 'unzip':
    ensure => present,
  }

  exec { 'wget-liferay':
    command => '/usr/bin/wget --output-document=/home/liferay/liferay.zip http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.1.1%20GA2/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip?r=\&ts=1357953553\&use_mirror=waix',
    creates => '/home/liferay/liferay.zip',
    group   => 'liferay',
    user    => 'liferay',
    require => Package['wget'],
  }

  exec { 'unzip-liferay':
    command => '/usr/bin/unzip /home/liferay/liferay.zip',
    user    => 'liferay',
    group   => 'liferay',
    cwd     => '/home/liferay/',
    creates => '/home/liferay/liferay-portal-6.1.1-ce-ga2',
    require => Package['unzip'],
  }
}

class myoffice::smartforms::client_liferay {
  class { 'myoffice::smartforms::client_liferay::get': }
}
