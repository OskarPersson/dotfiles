export HISTTIMEFORMAT="%d.%m.%y %T "
alias mampmysql="/Applications/MAMP/Library/bin/mysql --auto-rehash --host=localhost -uroot -p123"

function getJsonVal(){
    python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))"; 
}

export CLICOLOR=YES
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export TERM=xterm-256color
export EDITOR=emacs
