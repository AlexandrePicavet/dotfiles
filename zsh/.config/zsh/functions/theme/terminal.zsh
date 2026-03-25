TERMINAL_THEME_DIR="${ZDOTDIR}/functions/theme/terminal"

for theme_file in "${TERMINAL_THEME_DIR}"/*; do
	source "${theme_file}"
done

