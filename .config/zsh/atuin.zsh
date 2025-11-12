# https://docs.atuin.sh/guide/installation/

if check_install atuin; then
	eval "$(atuin init zsh)"

	bindkey '^r' atuin-search

	bindkey '^[[A' atuin-up-search
	bindkey '\eOA' atuin-up-search
	bindkey -M vicmd 'k' atuin-up-search
fi
