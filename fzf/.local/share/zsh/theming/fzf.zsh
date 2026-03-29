function _fzf_theme() {
	which fzf &>/dev/null || return 0

	local -r CONFIG_FILE=~/.config/zsh/fzf.zsh
	#shellcheck disable=2016
	local -r LIGHT_THEME_MATCH='FZF_COLOR="${FZF_LIGHT_COLOR}"'
	#shellcheck disable=2016
	local -r DARK_THEME_MATCH='FZF_COLOR="${FZF_DARK_COLOR}"'

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	#shellcheck disable=1090
	source "${CONFIG_FILE}"
	#shellcheck disable=1091
	source "${ZDOTDIR}/plugins/configurations/fzf-tab.zsh"
}

THEMES+=(_fzf_theme)
