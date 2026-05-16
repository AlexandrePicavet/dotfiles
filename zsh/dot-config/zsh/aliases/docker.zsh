if check_install -o docker; then
	alias d='docker'
	alias db='d build'
	alias dcl='d container list'
	alias dcla='dps -a'
	alias di='d image'
	alias dil='di list'
	alias dit='di tag'
	alias dp='d pull'
	alias ds='d system'
	alias dsp='ds prune'
fi
