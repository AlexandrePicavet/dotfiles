function _ashell_theme() {
	which ashell &>/dev/null || return 0

	readonly THEME_LINK_TARGET="${HOME}/.config/ashell/config.toml"
	readonly LIGHT_THEME_PATH="config-latte.toml"
	readonly DARK_THEME_PATH="config-macchiato.toml"

	local THEME
	THEME="${1}"
	readonly THEME

	_custom_theme_helper \
		"ln -sf '${LIGHT_THEME_PATH}' '${THEME_LINK_TARGET}'" \
		"ln -sf '${DARK_THEME_PATH}' '${THEME_LINK_TARGET}'" \
		"${THEME}"
}

THEMES+=(_ashell_theme)
