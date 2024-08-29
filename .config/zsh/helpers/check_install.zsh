check_install() {
	readonly package="$1"

	if which "$1" &>/dev/null
	then
		return 0
	else
		echo "${TEXT[reset]}Please install the ${TEXT[bred]}$1${TEXT[reset]} package"
		return 1
	fi
}
