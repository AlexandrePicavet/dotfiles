function kitty-theme() {
	which kitty &>/dev/null || return 0

	local -r LIGHT_THEME_NAME='Catppuccin-Latte'
	local -r DARK_THEME_NAME='Catppuccin-Macchiato'

	local THEME
	THEME="${1}"
	readonly THEME

	local THEME_NAME
	if [[ "${THEME}" == 'light' ]]; then
		THEME_NAME="${LIGHT_THEME_NAME}"
	elif [[ "${THEME}" == 'dark' ]]; then
		THEME_NAME="${DARK_THEME_NAME}"
	else
		echo "Expecting first argument to be 'light' or 'dark' but got: '${THEME}'" >&2
		return 1
	fi
	readonly THEME_NAME

	kitty +kitten themes --reload-in=all "${THEME_NAME}"
}
