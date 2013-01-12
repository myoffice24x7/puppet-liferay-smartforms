# myoffice/smartforms/client_user.pp

class myoffice::smartforms::client_user {
  user { 'liferay':
    ensure     => present,
    comment    => 'Liferay Portal',
    shell      => '/bin/bash',
    home       => '/home/liferay',
    managehome => true,
  }
}
