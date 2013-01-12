# myoffice/smartforms/client_db.pp

class myoffice::smartforms::client_db::install {
  class { 'percona':
    server          => true,
    percona_version => '5.5',
    manage_repo     => 'true',
  }
}

class myoffice::smartforms::client_db::configure {
  percona::database { 'liferay':
    ensure => present,
  }
  percona::rights { 'liferay_user@localhost/liferay':
    priv     => 'all',
    password => 'liferay_p@ssw0rd'
  }
}

class myoffice::smartforms::client_db {
  class { 'myoffice::smartforms::client_db::install': }
  class { 'myoffice::smartforms::client_db::configure': }
  Class['myoffice::smartforms::client_db::install'] -> Class['myoffice::smartforms::client_db::configure']
}
