define property (
  $ensure,
  $get_command,
  $set_command,
  $user         = undef,
  $environment  = undef,
  $path         = $::path,
) {
  require property::setup

  $compare       = $property::setup::compare_command
  $ext           = $property::setup::ext
  $safe_title    = regsubst($title, '[/\\ ]', '_', 'G')
  $get_path      = "${property::setup::vardir}/get_${safe_title}${ext}"
  $safe_get_path = shellquote($get_path)
  $safe_ensure   = shellquote($ensure)

  file { "get_${safe_title}":
    ensure  => file,
    mode    => $property::setup::mode,
    path    => $get_path,
    content => "${shebang}${get_command}",
  }

  exec { "set ${title} = $ensure":
    command     => $set_command,
    unless      => "${compare} ${safe_get_path} ${safe_ensure}",
    path        => $path,
    user        => $user,
    environment => $environment,
    require     => [
      File["get_${safe_title}"],
      File['property_compare_script'],
    ],
  }

}
