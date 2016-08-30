# == Class: orawls::utils::rcu
#    rcu for adf 12.1.2 & 12.1.3
#
define weblogic::utils::rcu(
  $fmw_product                 = 'adf', # adf|soa|mft
  $oracle_fmw_product_home_dir = undef,
  $rcu_action                  = 'create',
  $rcu_jdbc_url                = undef,   #jdbc...
  $rcu_database_url            = undef,   #192.168.50.5:1521:XE
  $rcu_prefix                  = undef,
  $rcu_password                = undef,
  $rcu_sys_user                = 'sys',
  $rcu_sys_password            = undef,
  ){
    ::orawls::utils::rcu { $name:
      version                     => $::weblogic::version,  # 1036|1111|1211|1212|1213|1221
      fmw_product                 => 'adf', # adf|soa|mft
      oracle_fmw_product_home_dir => undef,
      jdk_home_dir                => $::weblogic::jdk_home_dir,
      os_user                     => $::weblogic::os_user,      # oracle
      os_group                    => $::weblogic::os_group,     # dba
      download_dir                => $::weblogic::download_dir, # /data/install
      rcu_action                  => 'create',
      rcu_jdbc_url                => undef,   #jdbc...
      rcu_database_url            => undef,   #192.168.50.5:1521:XE
      rcu_prefix                  => undef,
      rcu_password                => undef,
      rcu_sys_user                => 'sys',
      rcu_sys_password            => undef,
      log_output                  => $::weblogic::log_output, # true|false
    }
  }
