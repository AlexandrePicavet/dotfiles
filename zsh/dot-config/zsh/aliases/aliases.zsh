ALIASES_DIR="${ZDOTDIR}/aliases"

unsetopt completealiases # Disable aliases custom completion

for alias_file in "${ALIASES_DIR}"/*; do
	[[ "${alias_file}" == "$0" ]] && continue

	source "${alias_file}"
done

