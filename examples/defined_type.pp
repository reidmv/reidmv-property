define example::type (
  $value,
  $setting,
) {

  property { "example::type $title value":
    ensure       => $value,
    get_command  => "/bin/echo value",
    set_command  => "/bin/echo ${value}",
  }

  property { "example::type $title setting":
    ensure       => $setting,
    get_command  => "/bin/echo correct",
    set_command  => "/bin/echo ${setting}",
  }

}

example::type { 'test':
  value   => 'incorrect',
  setting => 'correct',
}
