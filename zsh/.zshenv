ZDOTDIR="${HOME}/.config/zsh"

declare -a IGNORED_MISSING_PACKAGES
IGNORED_MISSING_PACKAGES=()


if [ -f ~/.user.zshenv ]; then
	source ~/.user.zshenv
fi
