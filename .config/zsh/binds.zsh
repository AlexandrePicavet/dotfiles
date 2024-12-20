# https://www.justus.pw/posts/2023-03-10-useful-zsh-shortcuts.html

# Navigation
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^A' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[4~' end-of-line

# Edition
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' delete-word
bindkey '^K' kill-line
bindkey '^H' backward-kill-line
bindkey '^U' kill-whole-line

# Vim
bindkey -r '^[' # Unbind vi normal mode key bind

# Pet snippets - https://github.com/knqyf263/pet?tab=readme-ov-file
if check_install pet; then
	zle -N pet-select
	stty -ixon
	bindkey '^s' pet-select
fi
