export PS1='\W \u$ '
alias mysql="/Applications/MAMP/Library/bin/mysql --auto-rehash --host=localhost -uroot -proot"
alias love="/Applications/love.app/Contents/MacOS/love"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Correct Vim colors
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

export GOPATH=$HOME/Git/go/
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.10/bin
export PATH="$MAMP_PHP:$PATH"

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
