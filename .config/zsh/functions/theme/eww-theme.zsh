function eww-theme() {
	which eww &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/eww/eww.scss
	local -r LIGHT_THEME_MATCH='themes\/latte'
	local -r DARK_THEME_MATCH='themes\/macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}
