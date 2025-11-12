# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#configuration

if check_install atuin; then
	ZSH_AUTOSUGGEST_STRATEGY=(atuin completion)
else
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

