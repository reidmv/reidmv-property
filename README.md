# Property #

This module provides a utility type for use in creating other defined types. It is a layer of abstraction on top of the basic Exec type, allowing the end user to think in terms of a getter, a setter, and a desired value.

## Example ##

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
        get_command  => template('custom/get_file2'),
        set_command  => template('custom/set_file2'),
      }

    }

The defined type could then be used as:

    custom::catfiles { 'test':
      file1_content => 'cat',
      file2_content => 'tac',
    }

## Limitations ##

This is a very early proof of concept module. It is functional, but expect
there to be bugs right now. At present it is also implemented as a defined
type, though ideally this would be implemented as a native Ruby type.
