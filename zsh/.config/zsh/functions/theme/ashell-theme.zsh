function ashell-theme() {
	which dunst &>/dev/null || return 0

	readonly THEME_LINK_TARGET="${HOME}/.config/ashell/config.toml"
	readonly LIGHT_THEME_PATH="config-latte.toml"
	readonly DARK_THEME_PATH="config-macchiato.toml"

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
}
