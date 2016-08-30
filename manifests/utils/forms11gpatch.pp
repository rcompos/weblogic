# == Define: orawls::utils::forms11gpatch
#
# installs FMW 11g forms patch
#
##
define webLogic::utils::forms11gpatch (
  $oracle_home_dir      = undef,                                      # /opt/oracle/middleware/Oracle_FRM1
  $fmw_file1            = undef,
  )
  {
    ::orawls::utils::forms11gpatch { $name:
      version              => $::weblogic::version,  # 1036|1111|1211|1212|1213
      weblogic_home_dir    => $::weblogic::weblogic_home_dir, # /opt/oracle/middleware11gR1/wlserver_103
      middleware_home_dir  => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      oracle_base_home_dir => $::weblogic::oracle_base_home_dir, # /opt/oracle
      oracle_home_dir      => undef,                                      # /opt/oracle/middleware/Oracle_FRM1
      jdk_home_dir         => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      fmw_file1            => undef,
      os_user              => $::weblogic::os_user, # oracle
      os_group             => $::weblogic::os_group, # dba
      download_dir         => $::weblogic::download_dir, # /data/install
      source               => $::weblogic::source, # puppet:///modules/orawls/ | /mnt | /vagrant
      remote_file          => $::weblogic::remote_file,                                       # true|false
      log_output           => $::weblogic::log_output,                                      # true|false
      temp_directory       => $::weblogic::temp_directory, # /tmp directory
    }
  }
