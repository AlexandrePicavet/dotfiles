# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#configuration

ZSH_AUTOSUGGEST_STRATEGY=()

if check_install -o atuin; then
	ZSH_AUTOSUGGEST_STRATEGY+="atuin"
fi

ZSH_AUTOSUGGEST_STRATEGY+=(history completion)

