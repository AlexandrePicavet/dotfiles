function _gtk_theme() {
	which gsettings &>/dev/null || return 0

	local THEME
	THEME="${1}"
	readonly THEME

	local result
	result="$(_custom_theme_helper \
		"gsettings set org.gnome.desktop.interface color-scheme prefer-light" \
		"gsettings set org.gnome.desktop.interface color-scheme prefer-dark" \
		"${THEME}" 2>&1)"

	[ "${result}" = "No schemas installed" ] &&
		echo "There was a problem while switching the GTK color scheme. Please open a new terminal and try again" >&2
}

THEMES+=(_gtk_theme)
