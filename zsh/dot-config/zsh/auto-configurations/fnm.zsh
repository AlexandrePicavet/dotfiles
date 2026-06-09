if check_install -o fnm; then
	fnm_shell="$(basename "${SHELL}")"
	eval "$(fnm env --use-on-cd --resolve-engines --shell "${fnm_shell}")"
	eval "$(fnm completions --shell "${fnm_shell}")"
	unset fnm_shell
fi
