# == Class weblogic::install
#
# This class is called from weblogic for install.
#
class weblogic::install {
  # Install weblogic
  class { '::orawls::weblogic':
    version              => $::weblogic::version,
    filename             => $::weblogic::filename,              # wls1036_generic.jar|wls1211_generic.jar|wls_121200.jar|wls_121300.jar|oepe-wls-indigo-installer-11.1.1.8.0.201110211138-10.3.6-linux32.bin
    oracle_base_home_dir => $::weblogic::oracle_base_home_dir,  # /opt/oracle
    middleware_home_dir  => $::weblogic::middleware_home_dir,   # /opt/oracle/middleware11gR1
    weblogic_home_dir    => $::weblogic::weblogic_home_dir,     # /opt/oracle/middleware11gR1/wlserver
    wls_domains_dir      => $::weblogic::wls_domains_dir,       # /opt/oracle/wlsdomains/domains
    wls_apps_dir         => $::weblogic::wls_apps_dir,          # /opt/oracle/wlsdomains/applications
    fmw_infra            => $::weblogic::fmw_infra,             # true|false 1212/1213/1221 option -> plain weblogic or fmw infra
    jdk_home_dir         => $::weblogic::jdk_home_dir,          # /usr/java/jdk1.7.0_45
    os_user              => $::weblogic::os_user,               # oracle
    os_group             => $::weblogic::os_group,              # dba
    download_dir         => $::weblogic::download_dir,          # /data/install
    source               => $::weblogic::source,                # puppet:///modules/orawls/ | /mnt | /vagrant
    remote_file          => $::weblogic::remote_file,           # true|false
    java_parameters      => $::weblogic::java_parameters,        # '-Dspace.detection=false'
    log_output           => $::weblogic::log_output,            # true|false
    temp_directory       => $::weblogic::temp_directory,        # /tmp temporay directory for files extractions
  }

  contain ::orawls::weblogic
}
