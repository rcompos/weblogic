# == Define: orawls::oud::instance
#
# create an Oracle Unified Directory LDAP instance
##
define weblogic::oud::instance (
  $oud_home                   = undef,
  $oud_instance_name          = undef,
  $oud_root_user_password     = undef,
  $oud_baseDN                 = 'dc=example,dc=com',
  $oud_ldapPort               = 1389,
  $oud_adminConnectorPort     = 4444,
  $oud_ldapsPort              = 1636,
  ){
    ::orawls::oud::instance { $name:
      version                => $::weblogic::version,
      oracle_base_home_dir   => $::weblogic::oracle_base_home_dir , # /opt/oracle
      middleware_home_dir    => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      oud_home               => undef,
      oud_instance_name      => undef,
      oud_root_user_password => undef,
      oud_baseDN             => 'dc=>example,dc=>com',
      oud_ldapPort           => 1389,
      oud_adminConnectorPort => 4444,
      oud_ldapsPort          => 1636,
      os_user                => $::weblogic::os_user, # oracle
      os_group               => $::weblogic::os_group, # dba
      download_dir           => $::weblogic::download_dir, # /data/install
      log_output             => $::weblogic::log_output, # true|false
    }
  }
