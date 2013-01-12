puppet-liferay-smartforms
=========================

Puppet manifest for deploying Liferay 6.1 + Percona MySQL + MyOffice24x7 SmartForms on a Debian-based system.

Instructions
------------
Clone into `modules/myoffice`.

Use as:
`node 'my.lifera.host' {
  include myoffice::smartforms::client
}`

A variety of parameters are available in `client_params.pp`, including:

* Database credentials
* Java version
* Liferay release
* SmartForms licence selection
