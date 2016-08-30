# Class: weblogic
# ===========================
#
# Full description of class weblogic here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class weblogic (
  Integer $version                    = $::weblogic::params::version,
  String $filename                    = $::weblogic::params::filename,             # wls1036_generic.jar|wls1211_generic.jar|wls_121200.jar|wls_121300.jar|oepe-wls-indigo-installer-11.1.1.8.0.201110211138-10.3.6-linux32.bin
  $java_install_filename              = $::weblogic::params::java_install_filename, # jdk-8u74-linux-x64.tar.gz
  String $oracle_base_home_dir        = $::weblogic::params::oracle_base_home_dir, # /opt/oracle
  String $middleware_home_dir         = $::weblogic::params::middleware_home_dir,  # /opt/oracle/middleware11gR1
  $weblogic_home_dir                  = $::weblogic::params::weblogic_home_dir,    # /opt/oracle/middleware11gR1/wlserver
  String $wls_domains_dir             = $::weblogic::params::wls_domains_dir,      # /opt/oracle/wlsdomains/domains
  String $wls_apps_dir                = $::weblogic::params::wls_apps_dir,         # /opt/oracle/wlsdomains/applications
  Variant[Boolean, String] $fmw_infra = $::weblogic::params::fmw_infra,            # true|false 1212/1213/1221 option -> plain weblogic or fmw infra
  String $jdk_home_dir                = $::weblogic::params::jdk_home_dir,         # /usr/java/jdk1.7.0_45
  String $os_user                     = $::weblogic::params::os_user,              # oracle
  String $os_group                    = $::weblogic::params::os_group,             # dba
  String $download_dir                = $::weblogic::params::download_dir,         # /data/install
  String $source                      = $::weblogic::params::source,               # puppet:///modules/orawls/ | /mnt | /vagrant
  Boolean $remote_file                = $::weblogic::params::remote_file,          # true|false
  String $java_parameters             = $::weblogic::params::java_parameters,       # '-Dspace.detection=false'
  Boolean $log_output                 = $::weblogic::params::log_output,           # true|false
  String $temp_directory              = $::weblogic::params::temp_directory,       # /tmp temporay directory for files extractions
) inherits ::weblogic::params {

  # validate parameters here
  contain ::weblogic::install
}
