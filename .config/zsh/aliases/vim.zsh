if check_install -o nvim; then
	alias vim='nvim --listen "/run/user/$(id -u)/nvim-$(uuidgen).pipe"'
	alias v='vim'
fi
