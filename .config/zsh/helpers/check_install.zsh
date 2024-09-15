declare -aU MISSING_PACKAGES;
MISSING_PACKAGES=()

check_install() {
	readonly package="${1}"

	if which "${package}" &>/dev/null
	then
		return 0
	else
		MISSING_PACKAGES+="${package}"
		return 1
	fi
}

print_missing_packages() {
	readonly packages_to_install=${MISSING_PACKAGES:|IGNORED_MISSING_PACKAGES}

	if [ ${#packages_to_install[@]} -eq 0 ]; then
		return
	fi

	echo "${TEXT[reset]}Please install the next packages: ${TEXT[bred]}${packages_to_install}${TEXT[reset]}"
}
