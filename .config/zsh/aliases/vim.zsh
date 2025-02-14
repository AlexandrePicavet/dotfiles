if check_install nvim; then
	alias vim='nvim --listen "/run/user/$(id -u)/nvim.pipe"'
	alias v='vim'
fi
