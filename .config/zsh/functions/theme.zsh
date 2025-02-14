THEME_DIR="${ZDOTDIR}/functions/theme"

function _theme_helper() {
	local -r CONFIG_FILE="${1}"
	local -r LIGHT_THEME_MATCH="${2}"
	local -r DARK_THEME_MATCH="${3}"
	local -r THEME="${4}"

	_custom_theme_helper \
		"sed -i 's/${DARK_THEME_MATCH}/${LIGHT_THEME_MATCH}/' '${CONFIG_FILE}'" \
		"sed -i 's/${LIGHT_THEME_MATCH}/${DARK_THEME_MATCH}/' '${CONFIG_FILE}'" \
		"${THEME}"
}

function _custom_theme_helper() {
	local -r ON_LIGHT="${1}"
	local -r ON_DARK="${2}"
	local -r THEME="${3}"

	if [[ "${THEME}" == 'light' ]]; then
		eval ${ON_LIGHT}
	elif [[ "${THEME}" == 'dark' ]]; then
		eval ${ON_DARK}
	else
		# Message for the final user (not the calling function)
		echo "Expecting first argument to be 'light' or 'dark' but got: '${THEME}'" >&2
		return 1
	fi
}

for theme_file in "${THEME_DIR}"/*; do
	source "${theme_file}"
done
