# == Define: orawls::oud::control
#
# start or stop an Oracle Unified Directory LDAP instance
##
define weblogic::oud::control(
  $oud_instances_home_dir = undef,
  $oud_instance_name      = undef,
  $action                 = 'start', # start|stop
  ) {
    ::orawls::oud::control { $name:
      oud_instances_home_dir => undef,
      oud_instance_name      => undef,
      action                 => 'start', # start|stop
      os_user                => $::weblogic::os_user, # oracle
      os_group               => $::weblogic::os_group, # dba
      log_output             => $::weblogic::log_output, # true|false
    }
  }
