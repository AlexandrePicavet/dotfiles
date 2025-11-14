if check_install -o eza; then
	alias ls='eza --hyperlink --color=always'
else
	alias ls='ls --hyperlink=always --color=always'
fi

alias l='ls -l'
alias la='ls -lah'
alias lab='la -B'
alias lb='l -B'
