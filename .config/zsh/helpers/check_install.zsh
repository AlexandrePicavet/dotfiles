declare -aU MISSING_PACKAGES;
MISSING_PACKAGES=()

check_install() {
	local optional=false
	if [ "${1}" = "-o" ]; then
		optional=true
		shift
	fi
	readonly optional

	local success=true
	for package in "${@}"; do
		if ! which "${package}" &>/dev/null; then
			success=false

			if ! "${optional}" || ${SHOW_OPTIONAL_PACKAGES:-false}; then
				MISSING_PACKAGES+="${package}"
			fi
		fi
	done

	return "${success}"
}

print_missing_packages() {
	readonly packages_to_install=${MISSING_PACKAGES:|IGNORED_MISSING_PACKAGES}

	if [ ${#packages_to_install[@]} -eq 0 ]; then
		return
	fi

	echo "${TEXT[reset]}Please install the next packages: ${TEXT[bred]}${packages_to_install}${TEXT[reset]}"
}
