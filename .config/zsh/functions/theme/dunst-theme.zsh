function dunst-theme() {
	which dunst &>/dev/null || return 0

	readonly THEME_LINK_TARGET="${HOME}/.config/dunst/dunstrc.d/theme.conf"
	readonly THEMES_PATH="themes"
	readonly LIGHT_THEME_PATH="${THEMES_PATH}/latte.conf"
	readonly DARK_THEME_PATH="${THEMES_PATH}/macchiato.conf"

	local THEME
	THEME="${1}"
	readonly THEME

	local CHOOSEN_THEME_PATH
	if [[ "${THEME}" == 'light' ]]; then
		CHOOSEN_THEME_PATH="${LIGHT_THEME_PATH}"
	elif [[ "${THEME}" == 'dark' ]]; then
		CHOOSEN_THEME_PATH="${DARK_THEME_PATH}"
	fi
	readonly CHOOSEN_THEME_PATH

	ln -sf "${CHOOSEN_THEME_PATH}" "${THEME_LINK_TARGET}"

	dunstctl reload 2>/dev/null
}
