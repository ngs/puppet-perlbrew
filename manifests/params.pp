# Class: perlbrew::params
#
#   This class contains some sane defintions for variables. This class
#   must not be used directly, it gets loaded by the other classes.
#
# Parameters:
# n/a
#
# Actions:
# n/a
#
# Requires:
# n/a
#
# Sample Usage:
# n/a
#
class perlbrew::params {

  $perlbrew_root = '/usr/local/perlbrew'
  $perlbrew_bin  = '/usr/local/bin/perlbrew'
  $cpanm_url     = 'http://github.com/miyagawa/cpanminus/raw/master/cpanm'

  case $::osfamily {
    'RedHat': {
      $build_pkgs = [ 'gcc', 'gcc-c++', 'make', ]
    }
    'Debian': {
      $build_pkgs = [ 'build-essential', ]
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}, ${::operatingsystem},
      module ${module_name} is supported for RedHat and Debian only")
    }
  }

}
