#
#  _       _                               __ ____ ____  
# | |     | |                             /_ |___ \___ \ 
# | | ____| | __ ___      _____  ___  _ __ | | __) |__) |
# | |/ / _` |/ _` \ \ /\ / / __|/ _ \| '_ \| ||__ <|__ < 
# |   < (_| | (_| |\ V  V /\__ \ (_) | | | | |___) |__) |
# |_|\_\__,_|\__,_| \_/\_/ |___/\___/|_| |_|_|____/____/ 
#
# https://github.com/kdawson133/
#
# @kirk133@fosstodon.org
#         
# config.fish
#
if status is-interactive
  cd  # Commands to run in interactive sessions can go here
end

# EXPORTS
set fish_greeting ""
set -gx TERM xterm-256color
set -gx COLORTERM truecolor
set -gx EDITOR nvim
set -gx LC_ALL en_AU.UTF-8
set -gx LANGUAGE en_AU:en
set -gx LANG en_AU.UTF-8
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_RUNTIME_DIR $HOME/.local/run
set -gx PYTHONSTARTUP /etc/python3/pythonrc
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx RBENV_ROOT $HOME/.config/rbenv
set -gx GEM_HOME $HOME/.config/gems

# PATHS
fish_add_path $CARGO_HOME/bin
fish_add_path $RBENV_ROOT/bin
fish_add_path $RBENV_ROOT/shims
fish_add_path $GEM_HOME/bin
if test -d $HOME/bin
  fish_add_path $HOME/bin
end
if test -d $HOME/.local/bin
  fish_add_path $HOME/.local/bin
end
if test -d /usr/local/bin
  fish_add_path /usr/local/bin
end

# THEME
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_user no
set -g theme_hide_hostname no
set -g theme_hostname always

# ALIASES
source (dirname (status --current-filename))/config-aliases.fish

# ABBREVIATIONS
source (dirname (status --current-filename))/config-abbr.fish

# OS Specific
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
