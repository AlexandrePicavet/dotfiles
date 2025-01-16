function theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	terminal-theme "${THEME}"
	hyprland-theme "${THEME}"
	dunst-theme "${THEME}"
	eww-theme "${THEME}"
}
