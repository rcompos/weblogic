# == Define: orawls::opatch
#
# installs oracle patches for Oracle products
#
##
define weblogic::opatch(
  $ensure                  = 'present',  #present|absent
  $oracle_product_home_dir = undef, # /opt/oracle/middleware11gR1
  $patch_id                = undef,
  $patch_file              = undef,
  )
  {
    ::orawls::opatch { $name:
      ensure                  => 'present',  #present|absent
      oracle_product_home_dir => undef, # /opt/oracle/middleware11gR1
      jdk_home_dir            => $::orawls::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
      patch_id                => undef,
      patch_file              => undef,
      os_user                 => $::weblogic::os_user, # oracle
      os_group                => $::weblogic::os_group, # dba
      download_dir            => $::weblogic::download_dir, # /data/install
      source                  => $::weblogic::source, # puppet:///modules/orawls/ | /mnt | /vagrant
      remote_file             => $::weblogic::remote_file,  # true|false
      log_output              => $::weblogic::log_output, # true|false
    }
  }
