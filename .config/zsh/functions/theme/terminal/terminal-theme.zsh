function terminal-theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	alacritty-theme "${THEME}"
	kitty-theme "${THEME}"
	tmux-theme "${THEME}"
	starship-theme "${THEME}"
	fzf-theme "${THEME}"
	git-delta-theme "${THEME}"
	btop-theme "${THEME}"
}
