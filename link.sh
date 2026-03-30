#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
SCRIPT_NAME=$(basename -- "${BASH_SOURCE[0]}")

function info() {
	echo -e "\e[34m${*}\e[0m"
}

function success() {
	echo -e "\e[32m${*}\e[0m"
}

function warn() {
	echo -e "\e[33m${*}\e[0m"
}

function error() {
	echo -e "\e[31m${*}\e[0m" >&2
}

function bold() {
	echo -e "\e[1m${*}\e[0m"
}

function help() {
	cat <<EOF
Usage: ${SCRIPT_NAME} [OPTION]... [PACKAGE]...
Link dotfiles PACKAGEs to the home directory using GNU stow.

Examples:
  ${SCRIPT_NAME}
  ${SCRIPT_NAME} nvim git

PACKAGE Specifies which package(s) to link. If no package is specified, all
packages in the script directory will be linked. Unknown packages will be
skipped with a warning message.

Options:
  $(bold "-h, --help")      display this help text and exit
  $(bold "-l, --list")      list the available packages and exit

Exit status:
  $(bold 0)  all specified packages linked successfully
  $(bold 1)  some packages failed to link

Notes:
  This script requires GNU stow to be installed. Each PACKAGE is a
  directory containing dotfiles that will be symlinked to the home directory.

  If a package directory contains a file named '.#required-packages', ${SCRIPT_NAME}
  will check for the presence of each tool listed in that file (whitespace separated)
  before attempting to link the package. Any missing tools will cause the
  package to be skipped with a warning message.
EOF
}

function list() {
	find . -maxdepth 1 -mindepth 1 -type d ! -name '.git' -printf "%f\n"
}

function satisfies_dependencies() {
	local -r package_path="$1"
	local -r required_package_file="${package_path}/.#required-packages"

	# required_packages_file does not exist, assume no dependencies
	[ -f "${required_package_file}" ] || return 0

	local -a missing_packages=()
	# shellcheck disable=SC2013
	for required_package in $(cat "${required_package_file}"); do
		which "${required_package}" &>/dev/null || {
			missing_packages+=("${required_package}")
		}
	done

	[[ -z "${missing_packages[*]}" ]] || {
		warn "$(basename "${package_path}"): skipped. Missing packages: ${missing_packages[*]}"
		return 1
	}

	return 0
}

function setup() {
	local -r package_path="$1"
	local -r package_setup_file="${package_path}/.#setup.sh"

	[ -f "${package_setup_file}" ] || return 0

	# shellcheck disable=SC1090
	source "${package_setup_file}" || return $?
	success "$(basename "${package_path}"): Ok"
}

function link() {
	local -ra packages_paths=("$@")
	local -i failed=0

	for package_path in "${packages_paths[@]}"; do
		stowit "$(basename "${package_path}")" || {
			((failed++)) || true
		}
	done

	return $((failed > 0))
}

function stowit() {
	package_path="$1"

	stow --dotfiles -Rt "${HOME}" "${package_path}" || {
		error "$(basename "${package_path}"): Error"
		return 1
	} && {
		success "$(basename "${package_path}"): Ok"
		return 0
	}
}

###############################################################################

# Handle cli arguments
declare -a PACKAGES=()
while [ $# -gt 0 ]; do
	case "$1" in
	-h | --help)
		help
		exit 0
		;;
	-l | --list)
		list
		exit 0
		;;
	-*)
		error "Unknown option: $1"
		help
		exit 1
		;;
	*)
		PACKAGES+=("$1")
		;;
	esac
	shift
done
readonly PACKAGES

# Check if stow is installed
which stow &>/dev/null || {
	error "You'll need GNU stow to run this script."
	exit 1
}

# Gather packages paths to link
declare -a PACKAGES_PATH_TO_LINK
if [ "${#PACKAGES[@]}" -eq 0 ]; then
	for package_path in "${SCRIPT_DIR}"/*; do
		[ -d "${package_path}" ] || continue

		satisfies_dependencies "${package_path}" || continue

		PACKAGES_PATH_TO_LINK+=("${package_path}")
	done
else
	for package in "${PACKAGES[@]}"; do
		package_path="${SCRIPT_DIR}/${package}"

		[ -d "${package_path}" ] || {
			warn "${package}: skipped, does not exist"
			continue
		}

		satisfies_dependencies "${package_path}" || continue

		PACKAGES_PATH_TO_LINK+=("${package_path}")
	done
fi
readonly PACKAGES_PATH_TO_LINK

# Execute all packages setup
info "Setting up packages..."
for package_path in "${PACKAGES_PATH_TO_LINK[@]}"; do
	setup "${package_path}" || {
		declare -ri code=$?
		error "\n$(basename "${package_path}"): Error"
		exit ${code}
	}
done
info "Setup complete."

# Link all packages
info "\nLinking packages..."
link "${PACKAGES_PATH_TO_LINK[@]}" || {
	declare -ri code=$?
	warn "Some packages failed to link. Check the error messages above for details."
	exit ${code}
}
info "All packages linked."
