define custom::catfiles (
  $file1_content,
  $file2_content,
) {

  property { "example::type $title file1":
    ensure       => $file1_content,
    get_command  => "/bin/cat /tmp/file1",
    set_command  => "/bin/echo ${file1_content} > /tmp/file1",
  }

  property { "example::type $title file2":
    ensure       => $file2_content,
    get_command  => "/bin/cat /tmp/file2",
    set_command  => "/bin/echo ${file2_content} > /tmp/file2",
  }

}

custom::catfiles { 'test':
  file1_content => 'cat',
  file2_content => 'tac',
}
