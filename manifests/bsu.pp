# == Define: orawls::bsu
#
# installs WebLogic BSU patch
##
define weblogic::bsu (
  $ensure              = 'present',  #present|absent
  $patch_id            = undef,
  $patch_file          = undef,
  )
  {
    ::orawls::bsu { $name:
      ensure              => $ensure,  #present|absent
      version             => $::weblogic::version,  # 1036|1111|1211
      middleware_home_dir => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
      weblogic_home_dir   => $::weblogic::weblogic_home_dir,
      jdk_home_dir        => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      patch_id            => $patch_id,
      patch_file          => $patch_file,
      os_user             => $::weblogic::os_user, # oracle
      os_group            => $::weblogic::os_group, # dba
      download_dir        => $::weblogic::download_dir, # /data/install
      source              => $::weblogic::source, # puppet:///modules/orawls/ | /mnt | /vagrant
      remote_file         => $::weblogic::remote_file,  # true|false
      log_output          => $::weblogic::log_output, # true|false
    }
  }
