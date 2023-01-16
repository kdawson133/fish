if status is-interactive
  cd  # Commands to run in interactive sessions can go here
end

set fish_greeting ""
set RBENV_ROOT ~/.config/rbenv
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx LANGUAGE en_AU:en
set -gx LANG en_AU.UTF-8
set -gx LC_ALL en_AU.UTF-8
# theme
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_user no
set -g theme_hide_hostname no
set -g theme_hostname always
# aliases
source (dirname (status --current-filename))/config-aliases.fish
# OS specific
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-macos.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end
# init rbenv
status --is-interactive; and ~/.config/rbenv/bin/rbenv init - fish | source
