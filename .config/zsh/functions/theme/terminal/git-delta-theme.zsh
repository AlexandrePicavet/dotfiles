function git-delta-theme() {
	local -r CONFIG_FILE=~/.gitconfig
	local -r LIGHT_THEME_MATCH='catppuccin-latte'
	local -r DARK_THEME_MATCH='catppuccin-macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}
