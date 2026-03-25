function gtk-theme() {
	which gsettings &>/dev/null || return 0

	local THEME
	THEME="${1}"
	readonly THEME

	_custom_theme_helper \
		"gsettings set org.gnome.desktop.interface color-scheme prefer-light" \
		"gsettings set org.gnome.desktop.interface color-scheme prefer-dark" \
		"${THEME}"
}
