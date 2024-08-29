zstyle :compinstall filename "${ZDOTDIR}/.zshrc"
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
