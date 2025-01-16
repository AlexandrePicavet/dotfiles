#!/bin/bash

function open-topbar() {
	declare -r monitor="${1}"
	declare -r id="topbar-${monitor}"

	eww open topbar --id "${id}" --arg "monitor=${monitor}"
}

while read -r monitor; do
	open-topbar "${monitor}"
done <<< "$(hyprctl monitors -j | jq -r '.[].name')"

socat -u "UNIX-CONNECT:${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" - |
	awk -F '>>|,' -e '/^monitoradded>>/{print $2}' |
	while read -r monitor; do
		open-topbar "${monitor}"
	done
