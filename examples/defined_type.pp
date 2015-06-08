define example::type (
  $value,
  $setting,
) {

  property { "$title value":
    value        => $value,
    get_command  => template(foo),
    set_command  => template(bar),
  }

  property { "$title setting":
    value        => $setting,
    get_command  => template(foo),
    set_command  => template(bar),
  }

}
