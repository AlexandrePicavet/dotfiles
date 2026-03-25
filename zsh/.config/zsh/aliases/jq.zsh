if check_install -o jq; then
	alias jq='jq --color-output'
	alias jql='jq | less'
	alias jqb='jq | b'
fi
