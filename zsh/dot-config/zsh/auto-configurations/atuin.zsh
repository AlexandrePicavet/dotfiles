# https://docs.atuin.sh/guide/installation/

if check_install -o atuin; then
	unset HISTFILE
	eval "$(atuin init zsh --disable-up-arrow)"
	fc -R =(atuin search --cmd-only --limit 100)

	bindkey -M viins '^R' atuin-search-viins
	bindkey -M vicmd '^R' atuin-search-vicmd

	bindkey -M viins '^[[1;5A' atuin-up-search-viins
	bindkey -M vicmd '^[[1;5A' atuin-up-search-vicmd
fi
