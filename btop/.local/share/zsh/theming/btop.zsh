function _btop_theme() {
	which btop &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/btop/btop.conf
	local -r LIGHT_THEME_MATCH='color_theme = "catppuccin_latte"'
	local -r DARK_THEME_MATCH='color_theme = "catppuccin_macchiato"'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}

THEMES+=(_btop_theme)
