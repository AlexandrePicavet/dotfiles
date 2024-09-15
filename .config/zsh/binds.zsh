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

# Vim
bindkey -r '^[' # Unbind vi normal mode key bind

if check_install sudo; then
	# Sudo
	# TODO needs improvements:
	# should sudo previous command if the current line is empty: https://superuser.com/a/1738638
	# should prepend sudo to the current line if it is not empty
	bindkey -s '\e\e' '^usudo !!^M^M'
fi
