setopt autocd extendedglob notify

ZPROFILE="/etc/zsh/zprofile"
[ -f "${ZPROFILE}" ] && source "${ZPROFILE}"

for script in "${ZDOTDIR}/helpers/"*.zsh; do
	source "${script}";
done

export_text_helper

source "${ZDOTDIR}/history.zsh"
source "${ZDOTDIR}/binds.zsh"
source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/starship.zsh"

source "${ZDOTDIR}/plugins/plugins-manager.zsh"

source "${ZDOTDIR}/aliases/aliases.zsh"

print_missing_packages
unset_text_helper

