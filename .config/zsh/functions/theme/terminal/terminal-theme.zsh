function terminal-theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	alacritty-theme "${THEME}"
	atuin-theme "${THEME}"
	btop-theme "${THEME}"
	fzf-theme "${THEME}"
	git-delta-theme "${THEME}"
	kitty-theme "${THEME}"
	nvim-theme "${THEME}"
	starship-theme "${THEME}"
	tmux-theme "${THEME}"
}
