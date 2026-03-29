# TODO create a specific .delta.git for theming

function _delta_theme() {
	which delta &>/dev/null || return 0

	local -r CONFIG_FILE=~/.gitconfig
	local -r LIGHT_THEME_MATCH='catppuccin-latte'
	local -r DARK_THEME_MATCH='catppuccin-macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}

THEMES+=(_delta_theme)
