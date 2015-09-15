# Ruby
get_path     = ARGV.shift
ensure_value = ARGV.shift
get_value    = %x{#{get_path}}.chomp
exit get_value == ensure_value ? 0 : -1
