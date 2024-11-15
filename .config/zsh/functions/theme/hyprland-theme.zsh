function hyprland-theme() {
	which hyprctl &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/hypr/theme.conf
	local -r LIGHT_THEME_MATCH='$THEME = light'
	local -r DARK_THEME_MATCH='$THEME = dark'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
	
	hyprctl reload > /dev/null
}
