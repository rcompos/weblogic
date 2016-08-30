# == Define: orawls::nodemanager
#
# install and configures the nodemanager
#
define weblogic::nodemanager (
  $domain_name                           = undef,
  $nodemanager_port                      = 5556,
  $nodemanager_address                   = undef,
  $nodemanager_secure_listener           = true,
  $jsse_enabled                          = false,
  $custom_trust                          = false,
  $trust_keystore_file                   = undef,
  $trust_keystore_passphrase             = undef,
  $custom_identity                       = false,
  $custom_identity_keystore_filename     = undef,
  $custom_identity_keystore_passphrase   = undef,
  $custom_identity_alias                 = undef,
  $custom_identity_privatekey_passphrase = undef,
  $log_dir                               = undef, # /data/logs
  $log_file                              = 'nodemanager.log',
  $sleep                                 = 20, # default sleep time
  $properties                            = {},
    $ohs_standalone                        = false,
    )
    {
      # Must include domain_name
      unless $domain_name {
        fail('A nodemanager must be associated with a domain.')
      }

      ::orawls::nodemanager { $name:
        domain_name                           => $domain_name,
        version                               => $::weblogic::version,  # 1036|1111|1211|1212|1213
        middleware_home_dir                   => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
        weblogic_home_dir                     => $::weblogic::weblogic_home_dir,
        nodemanager_port                      => $nodemanager_port,
        nodemanager_address                   => $nodemanager_address,
        nodemanager_secure_listener           => $nodemanager_secure_listener,
        jsse_enabled                          => $jsse_enabled,
        custom_trust                          => $custom_trust,
        trust_keystore_file                   => $trust_keystore_file,
        trust_keystore_passphrase             => $trust_keystore_passphrase,
        custom_identity                       => $custom_identity,
        custom_identity_keystore_filename     => $custom_identity_keystore_filename,
        custom_identity_keystore_passphrase   => $custom_identity_keystore_passphrase,
        custom_identity_alias                 => $custom_identity_alias,
        custom_identity_privatekey_passphrase => $custom_identity_keystore_passphrase,
        wls_domains_dir                       => $::weblogic::wls_domains_dir,
        jdk_home_dir                          => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
        os_user                               => $::weblogic::os_user, # oracle
        os_group                              => $::weblogic::os_group, # dba
        download_dir                          => $::weblogic::download_dir, # /data/install
        log_dir                               => $log_dir, # /data/logs
        log_file                              => $log_dir,
        log_output                            => $::weblogic::log_output, # true|false
        sleep                                 => $sleep, # default sleep time
        properties                            => $properties,
        ohs_standalone                        => $ohs_standalone,
      }
    }
