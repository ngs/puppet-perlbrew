# Class: perlbrew::install
#
#   This class will install the perlbrew script itself and uses the package
#   manager of the operating system to install the required compiler
#   toolchain. The compiler toolchain is required to compile the Perl
#   interpreter later.
#
#
# Parameters:
# * $build_pkgs:  - Packages which are required to build the compiler toolchain
#
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class perlbrew::install (
  $build_pkgs = $perlbrew::params::build_pkgs,
) inherits perlbrew::params {

  package { [ $build_pkgs ]:
    ensure => present,
  }

  package {
    'wget':
      ensure => present,
  }

  file {
    $perlbrew::params::perlbrew_bin:
      owner   => root,
      group   => root,
      mode    => '0755',
      source  => "puppet:///modules/${module_name}/perlbrew",
  }

}
