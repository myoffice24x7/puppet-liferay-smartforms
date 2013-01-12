# smartforms/client.pp

class myoffice::smartforms::client(
  $java_ver = $myoffice::smartforms::client_params::java_ver
) inherits myoffice::smartforms::client_params {
 
  class { 'java':
    java_version => $java_ver
  }
  class { 'apt': }

  class { 'myoffice::smartforms::client_db': }
  class { 'myoffice::smartforms::client_user': }
  class { 'myoffice::smartforms::client_liferay': }
  class { 'myoffice::smartforms::client_portlet': }

  file { '/etc/profile.d/java.sh':
    ensure  => present,
    content => "export JAVA_HOME=/opt/java/jdk${java_ver} && export PATH=\$PATH:\$JAVA_HOME/bin/",
    mode    => 'a+x',
    owner   => 'root',
    group   => 'root'
  }

  Class['apt'] -> Class['myoffice::smartforms::client_db']
  Class['myoffice::smartforms::client_liferay'] -> Class['myoffice::smartforms::client_portlet']
}
