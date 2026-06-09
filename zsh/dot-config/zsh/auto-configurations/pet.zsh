if check_install -o pet; then

	function pet-select() {
		BUFFER=$(pet search --query "$LBUFFER")
		CURSOR=$#BUFFER
		zle redisplay
	}

	function pet-prev() {
		PREV=$(fc -lrn | head -n 1)
		sh -c "pet new $(printf %q "$PREV")"
	}

	zle -N pet-select
	stty -ixon
	bindkey '^s' pet-select

fi
