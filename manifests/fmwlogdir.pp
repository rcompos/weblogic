# == Define: orawls::fmwlogdir
#
# generic fmwlogdir wlst script, runs the WLST command from the oracle common home
# Moves the fmw log files like  AdminServer-diagnostic.log or AdminServer-owsm.log
# to a different location outside your domain
#
# pass on the weblogic username or password
# or provide userConfigFile and userKeyFile file locations
#
#
#
define weblogic::fmwlogdir (
  $adminserver_address = 'localhost',
  $adminserver_port    = 7001,
  $weblogic_user       = 'weblogic',
  $weblogic_password   = undef,
  $userConfigFile      = undef,
  $userKeyFile         = undef,
  $server              = 'AdminServer',
  $log_dir             = undef, # /data/logs
  )
  {
    ::orawls::fmwlogdir { $name:
      middleware_home_dir => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      adminserver_address => $adminserver_address,
      adminserver_port    => $adminserver_port,
      weblogic_user       => $weblogic_user,
      weblogic_password   => $weblogic_password,
      userConfigFile      => $userConfigFile,
      userKeyFile         => $userKeyFile,
      os_user             => $::weblogic::os_user, # oracle
      os_group            => $::weblogic::os_group, # dba
      download_dir        => $::weblogic::download_dir, # /data/install
      log_output          => $::weblogic::log_output, # true|false
      server              => $server,
      log_dir             => $log_dir, # /data/logs
    }
  }
