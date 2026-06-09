#shellcheck disable=1090,1091,1094

setopt autocd extendedglob notify

ZPROFILE="/etc/zsh/zprofile"
[ -f "${ZPROFILE}" ] && source "${ZPROFILE}"

path+=("${HOME}/.local/bin")

for script in "${ZDOTDIR}/helpers/"*.zsh; do
	source "${script}"
done

export_text_helper

for autoconf in "${ZDOTDIR}/auto-configurations/"*.zsh; do
	source "${autoconf}"
done

source "${ZDOTDIR}/binds.zsh"
source "${ZDOTDIR}/completion.zsh"

source "${ZDOTDIR}/plugins/plugins-manager.zsh"

source "${ZDOTDIR}/aliases/aliases.zsh"
source "${ZDOTDIR}/functions/functions.zsh"

if [ -f "${HOME}/.user.zshrc" ]; then
	source "${HOME}/.user.zshrc"
fi

print_missing_packages
unset_text_helper
