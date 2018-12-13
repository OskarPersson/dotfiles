# remove intro message
set fish_greeting ""

# set default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# set color scheme (https://github.com/Jomik/fish-gruvbox)
if status --is-interactive
  theme_gruvbox dark medium
end

# set language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# direnv
eval (direnv hook fish)

# rust
source $HOME/.cargo/env

# python
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# bat
export BAT_THEME="gruvbox (Dark) (Medium)"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,*.pyc}" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# MySQL

export PATH="$PATH:/usr/local/opt/mysql@5.7/bin:/usr/local/sbin"
