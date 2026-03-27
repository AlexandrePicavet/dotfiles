#!/usr/bin/env bash

set -euo pipefail

readonly BASEDIR="${HOME}/.local/share/hypr/monitors"

mkdir -p "${BASEDIR}"

function isSubset() {
	local -n subset="${1}"
	local -n set="${2}"

	for subset_element in "${subset[@]}"; do
		local found=false

		for set_element in "${set[@]}"; do
			if [[ "${set_element}" =~ ^"${subset_element}" ]]; then
				found=true
				break
			fi
		done

		if [[ "${found}" == false ]]; then
			return 1
		fi
	done

	return 0
}

declare -a connected_monitors
readarray -t connected_monitors <<<"$(hyprctl monitors | sed -n 's/^.*description: //gp')"
# shellcheck disable=SC2034 # Passed by reference to the isSubset function
readonly connected_monitors

for monitor_config in "${BASEDIR}"/*; do
	monitor_config_file="$(basename "${monitor_config}")"
	# shellcheck disable=SC2034 # Passed by reference to the isSubset function
	readarray -t config_monitors <<<"$(sed -nE 's/^[^#]*desc:([^,#]*).*$/\1/gp' "${monitor_config}")"

	isSubset 'config_monitors' 'connected_monitors' || continue

	echo "Matches monitor config: ${monitor_config_file}"

	hyprctl keyword source "${monitor_config}" &>/dev/null
done
