function _kitty_theme() {
	which kitty &>/dev/null || return 0

	local -r CONFIG_FILE=~/.local/share/kitty/theme.conf
	local -r LIGHT_THEME_MATCH='latte'
	local -r DARK_THEME_MATCH='macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	# Reload config
	pgrep kitty &>/dev/null || return 0
	kill -SIGUSR1 $(pgrep kitty)
}

THEMES+=(_kitty_theme)
