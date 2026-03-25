function theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	(
		ashell-theme "${THEME}" &
		dunst-theme "${THEME}" &
		gtk-theme "${THEME}" &
		hyprland-theme "${THEME}" &
		terminal-theme "${THEME}" &
	)
}
