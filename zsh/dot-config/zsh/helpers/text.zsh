declare -A TEXT
TEXT=(
	[red]="\033[0;31m"
	[bred]="\033[1;31m"
	[reset]="\033[0m"
)

export_text_helper() {
	export TEXT
}

unset_text_helper() {
	unset TEXT
}
