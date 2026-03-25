function atuin-theme() {
	local -r CONFIG_FILE=~/.config/atuin/config.toml
	local -r LIGHT_THEME_MATCH='name = "catppuccin-latte"'
	local -r DARK_THEME_MATCH='name = "catppuccin-macchiato"'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"
}
