if status is-interactive
  cd  # Commands to run in interactive sessions can go here
end

set fish_greeting ""
set -gx TERM xterm-256color
set -gx COLORTERM truecolor
set -gx EDITOR nvim
set -gx LC_ALL en_AU.UTF-8
set -gx LANGUAGE en_AU:en
set -gx LANG en_AU.UTF-8
set -gx PYTHONSTARTUP /etc/python3/pythonrc
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx PATH $CARGO_HOME/bin:$PATH
set -gx RBENV_ROOT $HOME/.config/rbenv
set -gx PATH $HOME/.config/rbenv/bin:$PATH
set -gx PATH $HOME/.config/rbenv/shims:$PATH
set -gx GEM_HOME $HOME/.config/gems
set -gx PATH $HOME/.config/gems/bin:$PATH

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
