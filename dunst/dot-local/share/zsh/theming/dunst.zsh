function _dunst_theme() {
	which dunst &>/dev/null || return 0

	readonly THEME_LINK_TARGET="${HOME}/.config/dunst/dunstrc.d/theme.conf"
	readonly THEMES_PATH="themes"
	readonly LIGHT_THEME_PATH="${THEMES_PATH}/latte.conf"
	readonly DARK_THEME_PATH="${THEMES_PATH}/macchiato.conf"

	local THEME
	THEME="${1}"
	readonly THEME

	_custom_theme_helper \
		"ln -sf '${LIGHT_THEME_PATH}' '${THEME_LINK_TARGET}'" \
		"ln -sf '${DARK_THEME_PATH}' '${THEME_LINK_TARGET}'" \
		"${THEME}"

	systemctl --user restart dunst
}

THEMES+=(_dunst_theme)
