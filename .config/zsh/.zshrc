setopt autocd extendedglob notify

ZPROFILE="/etc/zsh/zprofile"
[ -f "${ZPROFILE}" ] && source "${ZPROFILE}"

path+=("${HOME}/.local/bin")

for script in "${ZDOTDIR}/helpers/"*.zsh; do
	source "${script}";
done

export_text_helper

source "${ZDOTDIR}/history.zsh"
source "${ZDOTDIR}/binds.zsh"
source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/starship.zsh"
source "${ZDOTDIR}/fzf.zsh"

source "${ZDOTDIR}/plugins/plugins-manager.zsh"

source "${ZDOTDIR}/aliases/aliases.zsh"
source "${ZDOTDIR}/functions/functions.zsh"

print_missing_packages
unset_text_helper

if [ -f "${HOME}/.user.zshrc" ]; then
	source "${HOME}/.user.zshrc"
fi
