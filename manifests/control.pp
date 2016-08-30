# == Define: orawls::control
#
# Weblogic Server control, starts or stops a managed server
#
#  action        = start|stop
#  wlsServerType = admin|managed
#  wlsTarget     = Server|Cluster
#
define weblogic::control (
  $domain_name                 = undef,
  $weblogic_password           = undef,
  $server_type                 = 'admin',  # admin|managed|ohs_standalone
  $target                      = 'Server', # Server|Cluster
  $server                      = 'AdminServer',
  $adminserver_address         = 'localhost',
  $adminserver_port            = 7001,
  $nodemanager_secure_listener = true,
  $nodemanager_port            = 5556,
  $action                      = 'start', # start|stop
  $weblogic_user               = 'weblogic',
  $jsse_enabled                = false,
  $custom_trust                = false,
  $trust_keystore_file         = undef,
  $trust_keystore_passphrase   = undef,
)
{
  # Must include domain_name
  unless $domain_name {
    fail('A weblogic control must be associated with a domain.')
  }

  # Must include weblogic password
  unless $weblogic_password {
    fail('A weblogic password is needed to modify a control.')
  }

  ::orawls::control { $name:
    domain_name                 => $domain_name,
    weblogic_password           => $weblogic_password,
    middleware_home_dir         => $::weblogic::middleware_home_dir, # /opt/oracle/middleware11gR1
    weblogic_home_dir           => $::weblogic::weblogic_home_dir,
    jdk_home_dir                => $::weblogic::jdk_home_dir, # /usr/java/jdk1.7.0_45
    wls_domains_dir             => $::weblogic::wls_domains_dir,
    server_type                 => $server_type,  # admin|managed|ohs_standalone
    target                      => $target, # Server|Cluster
    server                      => $server,
    adminserver_address         => $adminserver_address,
    adminserver_port            => $adminserver_port,
    nodemanager_secure_listener => $nodemanager_secure_listener,
    nodemanager_port            => $nodemanager_port,
    action                      => $action, # start|stop
    weblogic_user               => $weblogic_user,
    jsse_enabled                => $jsse_enabled,
    custom_trust                => $custom_trust,
    trust_keystore_file         => $trust_keystore_file,
    trust_keystore_passphrase   => $trust_keystore_passphrase,
    os_user                     => $::weblogic::os_user, # oracle
    os_group                    => $::weblogic::os_group, # dba
    download_dir                => $::weblogic::download_dir, # /data/install
    log_output                  => $::weblogic::log_output, # true|false
  }
}
