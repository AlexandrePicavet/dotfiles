FUNCTIONS_DIR="${ZDOTDIR}/functions"

for functions_file in "${FUNCTIONS_DIR}"/*; do
	[[ "${functions_file}" == "$0" ]] && continue

	source "${functions_file}"
done

