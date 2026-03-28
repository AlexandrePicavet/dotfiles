declare -a THEMES=()

function _custom_theme_helper() {
	declare -r ON_LIGHT="${1}"
	declare -r ON_DARK="${2}"
	declare -r THEME="${3}"

	if [[ "${THEME}" == 'light' ]]; then
		# shellcheck disable=SC2086
		eval ${ON_LIGHT}
	elif [[ "${THEME}" == 'dark' ]]; then
		# shellcheck disable=SC2086
		eval ${ON_DARK}
	else
		# Message for the final user (not the calling function)
		echo "Expecting first argument to be 'light' or 'dark' but got: '${THEME}'" >&2
		return 1
	fi
}

function _theme_helper() {
	declare -r CONFIG_FILE="${1}"
	declare -r LIGHT_THEME_MATCH="${2}"
	declare -r DARK_THEME_MATCH="${3}"
	declare -r THEME="${4}"

	_custom_theme_helper \
		"sed -i 's/${DARK_THEME_MATCH}/${LIGHT_THEME_MATCH}/' '${CONFIG_FILE}'" \
		"sed -i 's/${LIGHT_THEME_MATCH}/${DARK_THEME_MATCH}/' '${CONFIG_FILE}'" \
		"${THEME}"
}

function theme() {
	declare THEME
	THEME="${1}"
	readonly THEME

	(
		for theme_function in "${THEMES[@]}"; do
			"${theme_function}" "${THEME}" &
		done
	)
}

for theme_file in "${ZTHEMEDIR}"/*; do
	[ -d "${theme_file}" ] || {
		source "${theme_file}"
	}
done
