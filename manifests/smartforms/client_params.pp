# myoffice/smartforms/client_params.pp

class myoffice::smartforms::client_params {

  $java_ver = '1.6.0_38'

  $db_name  = 'liferay'
  $db_user  = 'liferay'
  $db_pass  = 'liferay_p@ssw0rd'

  $web_user = 'liferay'

  # These 3 next params are all linked, if you change to another Liferay Portal release ensure that the other params still make sense
  $lr_dl    = 'http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.1.1%20GA2/liferay-portal-tomcat-6.1.1-ce-ga2-20120731132656558.zip?r=\&ts=1357953553\&use_mirror=waix'
  $lr_root  = "/home/${web_user}/liferay-portal-6.1.1-ce-ga2"
  $tc_root  = "${lr_root}/tomcat-7.0.27"

  $portlet  = 'http://downloads.smartforms.myoffice24x7.com/portlet/smartform-runtime-portlet.war'
  $licence  = 'eu-west'

}
