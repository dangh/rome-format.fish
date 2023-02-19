function _rome_format_install -e rome-format_install -e rome-format_update
  mkdir -p $HOME/bin
  fish_add_path $HOME/bin
  ln -sf $HOME/.config/fish/functions/rome-format.fish $HOME/bin/rome-format
end

function _rome_format_uninstall -e rome-format_uninstall
  rm -f $HOME/bin/rome-format
end
