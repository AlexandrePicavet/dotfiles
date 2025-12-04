#!/usr/bin/env bash

set -euo pipefail

readonly BASEDIR="${HOME}/.config/hypr/user/monitors"

function isSubset() {
	local -n subset="${1}"
	local -n set="${2}"

	for subset_element in "${subset[@]}"; do
		local found=false

		for set_element in "${set[@]}"; do
			if [[ "${subset_element}" == "${set_element}" ]]; then
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
	# shellcheck disable=SC2034 # Passed by reference to the isSubset function
	readarray -t config_monitors <<<"$(sed -nE 's/^[^#]*desc:([^,#]*).*$/\1/gp' "${monitor_config}")"

	isSubset 'config_monitors' 'connected_monitors' || continue

	echo "Matches monitor config: ${monitor_config}"

	hyprctl keyword source "${monitor_config}"
done

hyprctl keyword source ~/.config/hypr/wallpaper.conf
