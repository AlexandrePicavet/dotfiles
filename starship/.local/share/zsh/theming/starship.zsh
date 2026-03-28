function _starship_theme() {
	which starship &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/starship.toml
	local -r LIGHT_THEME_MATCH='palette = "catppuccin_latte"'
	local -r DARK_THEME_MATCH='palette = "catppuccin_macchiato"'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}

THEMES+=(_starship_theme)
