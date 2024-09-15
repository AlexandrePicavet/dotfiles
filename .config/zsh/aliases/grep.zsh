if check_install grep; then
	alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
	alias egrep='grep -E'
	alias fgrep='grep -F'
	alias rgrep='grep -R'
fi
