class property::setup {
  assert_private()

  $vardir         = "${puppet_vardir}/property_module"
  $compare_script = "${vardir}/get_compare.rb"

  case $::osfamily {
    'windows': {
      $ext = '.ps1'
      $mode = undef
      $compare_command = "ruby.exe '${compare_script}'"
      $shebang = ''
    }
    default: {
      $ext = '.rb'
      $mode = '0755'
      $compare_command = "/opt/puppetlabs/puppet/bin/ruby '${compare_script}'"
      $shebang = '/bin/sh\n'
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
    content => file('property/get_compare.rb'),
  }

}
