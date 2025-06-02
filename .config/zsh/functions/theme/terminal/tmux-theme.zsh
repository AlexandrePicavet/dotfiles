function tmux-theme() {
	which tmux &>/dev/null || return 0

	local -r CONFIG_FILE=~/.tmux.conf
	local -r LIGHT_THEME_MATCH='latte'
	local -r DARK_THEME_MATCH='macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	tmux source ${CONFIG_FILE} &> /dev/null
}
