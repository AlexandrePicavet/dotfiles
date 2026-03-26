# shellcheck disable=SC2034
ZDOTDIR="${HOME}/.config/zsh"
ZSHAREDIR="${HOME}/.local/share/zsh"

# shellcheck disable=SC2034
declare -a IGNORED_MISSING_PACKAGES=()


# shellcheck source="${HOME}/.user.zshenv"
if [ -f ~/.user.zshenv ]; then
	source ~/.user.zshenv
fi
