THEME_DIR="${ZDOTDIR}/functions/theme"

function _theme_helper() {
 local -r CONFIG_FILE="${1}"
 local -r LIGHT_THEME_MATCH="${2}"
 local -r DARK_THEME_MATCH="${3}"
 local -r THEME="${4}"


	if [[ "${THEME}" == 'light' ]]; then
		sed -i "s/${DARK_THEME_MATCH}/${LIGHT_THEME_MATCH}/" "${CONFIG_FILE}"
	elif [[ "${THEME}" == 'dark' ]]; then
		sed -i "s/${LIGHT_THEME_MATCH}/${DARK_THEME_MATCH}/" "${CONFIG_FILE}"
	else
		# Message for the final user (not the calling function)
		echo "Expecting first argument to be 'light' or 'dark' but got: '${THEME}'" >&2
		return 1
	fi
}

for theme_file in "${THEME_DIR}"/*; do
	[[ "${theme_file}" == "$0" ]] && continue

	source "${theme_file}"
done

