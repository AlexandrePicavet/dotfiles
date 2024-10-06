function fzf-theme() {
	local -r CONFIG_FILE=~/.config/zsh/fzf.zsh
	local -r LIGHT_THEME_MATCH='FZF_COLOR="${FZF_LIGHT_COLOR}"'
	local -r DARK_THEME_MATCH='FZF_COLOR="${FZF_DARK_COLOR}"'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	source ${CONFIG_FILE}
	source "${ZDOTDIR}/plugins/configurations/fzf-tab.zsh"
}

