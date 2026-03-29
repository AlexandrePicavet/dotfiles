if check_install -o z; then
	alias cd='z'
fi
alias -- -='cd -'
alias ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
