define property (
  $ensure,
  $get_command,
  $set_command,
  $path         = undef,
  $user         = undef,
  $environment  = undef,
  $path         = $::path,
) {
  require property::setup

  $compare       = $property::setup::compare_command
  $get_path      = "${property::setup::vardir}/${title}_get"
  $safe_get_path = shellquote($get_path)
  $safe_ensure   = shellquote($ensure)

  file { "get_${title}":
    ensure  => file,
    path    => $get_command_path,
    content => $get_command,
  }

  exec { "update_${title}":
    command     => $set_command,
    unless      => "${compare} ${safe_get_path} ${safe_ensure}",
    path        => $path,
    user        => $user,
    environment => $environment,
  }

}
