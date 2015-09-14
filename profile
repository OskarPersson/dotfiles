export PS1='\W \u$ '
alias mysql="/Applications/MAMP/Library/bin/mysql --auto-rehash --host=localhost -uroot -proot"
alias emacs='/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

export GOPATH=$HOME/Git/go/
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
