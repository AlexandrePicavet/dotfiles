function kitty-theme() {
	which kitty &>/dev/null || return 0
	pgrep kitty &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/kitty/kitty.conf
	local -r LIGHT_THEME_MATCH='include themes\/catppuccin-latte.conf'
	local -r DARK_THEME_MATCH='include themes\/catppuccin-macchiato.conf'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	# Reload config
	kill -SIGUSR1 $(pgrep kitty)
}
