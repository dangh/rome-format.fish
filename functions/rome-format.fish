function rome-format
  set -l args $argv
  set -l dir

  argparse -i \
    'write' \
    'skip-errors' \
    'max-diagnostics=?!_validate_int' \
    'verbose' \
    'indent-style=' \
    'indent-size=!_validate_int' \
    'line-width=!_validate_int' \
    'quote-style=' \
    'quote-properties=' \
    'trailing-comma=' \
    'semicolons=' \
    'stdin-file-path=' \
    -- $argv
  or return 1

  if test -n "$argv"
    set dir $argv[1]
  else if set -q _flag_stdin_file_path
    set dir $_flag_stdin_file_path
  end

  test -e "$dir"; or return 1
  test -f "$dir" && set dir (path dirname -- "$dir")

  # find rome.json in ancestor dirs
  while test -n "$dir"
    if test -f $dir/rome.json
      break
    else
      set dir (path dirname $dir); or return 1
    end
  end

  command rome format $args
end
