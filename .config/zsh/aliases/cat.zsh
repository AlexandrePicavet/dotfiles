if check_install -o bat; then
	alias b='bat'
	alias c='bat -p'
else
	alias c='cat'
fi
