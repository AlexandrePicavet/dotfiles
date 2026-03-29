zstyle :compinstall filename "${ZDOTDIR}/.zshrc"
autoload -Uz compinit && compinit -d "${ZSHAREDIR}/.zcompdump"
autoload -U +X bashcompinit && bashcompinit
