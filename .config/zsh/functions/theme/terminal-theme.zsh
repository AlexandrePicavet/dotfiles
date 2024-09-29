function terminal-theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	tmux-theme "${THEME}"
	starship-theme "${THEME}"
	alacritty-theme "${THEME}"
	fzf-theme "${THEME}"
}
