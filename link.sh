#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
SCRIPT_NAME=$(basename -- "${BASH_SOURCE[0]}")

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

function link() {
	local -i failed=0
	for package_path in "${SCRIPT_DIR}"/*; do
		[ -d "${package_path}" ] || continue # skip non directories

		if satisfies_dependencies "${package_path}"; then
			stowit "$(basename "${package_path}")" || {
				((failed++)) || true
			}
		fi
	done

	# shellcheck disable=SC2046
	return $([ "${failed}" -eq 0 ])
}

function link_given() {
	local -ra packages=("$@")
	local -i failed=0
	for package in "${packages[@]}"; do
		package_path="${SCRIPT_DIR}/${package}"

		[ -d "${package_path}" ] || {
			warn "${package}: skipped: does not exist"
			continue
		}

		if satisfies_dependencies "${package_path}"; then
			stowit "$(basename "${package_path}")" || {
				((failed++)) || true
			}
		fi
	done

	return $((failed > 0))
}

function satisfies_dependencies() {
	package_path="$1"
	required_packages_file="${package_path}/.#required-packages"

	# required_packages_file does not exist, assume no dependencies
	[ -f "${required_packages_file}" ] || return 0

	local -a missing_packages=()
	# shellcheck disable=SC2013
	for required_package in $(cat "${required_packages_file}"); do
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

function stowit() {
	package_path="$1"

	stow -Rt "${HOME}" "${package_path}" || {
		error "$(basename "${package_path}"): failed"
		return 1
	} && {
		success "$(basename "${package_path}"): linked"
		return 0
	}
}

declare -a packages=()

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
		packages+=("$1")
		;;
	esac
	shift
done

which stow &>/dev/null || {
	error "You'll need GNU stow to run this script."
	exit 1
}

if [ "${#packages[@]}" -eq 0 ]; then
	link
else
	link_given "${packages[@]}"
fi
