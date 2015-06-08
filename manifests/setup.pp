class property::setup {

  $vardir         = "${puppet_vardir}/property_module"
  $compare_script = "${vardir}/get.rb"

  case $::osfamily {
    'windows': {
      $mode = undef,
      $compare_command = "ruby.exe '${compare_script}'"
    }
    default: {
      $mode = '0755'
      $get_command = $compare_script
    }
  }

  file { 'property_vardir':
    ensure => directory,
    path   => $vardir,
    mode   => $mode,
  }

  file { 'property_compare_script':
    ensure  => file,
    path    => $compare_script,
    mode    => $mode,
    content => template('property/get.rb.erb'),
  }

}
