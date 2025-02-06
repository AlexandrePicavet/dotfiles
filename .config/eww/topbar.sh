#!/bin/bash

set -euo pipefail

MONITOR_PREFIX="monitor:"

function open-topbar() {
	local -r monitor="${1}"
	local -r id="topbar-${monitor}"

	echo "Opening topbar with id '${id}' on monitor '${monitor}'..."
	if eww open topbar --id "${id}" --arg "monitor=${monitor}" 1>/dev/null; then
		echo -e '\t\e[32mOK\e[0m'
	else
		echo -e '\t\e[31mFailed\e[0m'
	fi
}

function list-monitors() {
	hyprctl monitors -j | jq -r '.[].name'
}

function open-on-all-monitors() {
	while read -r monitor; do
		open-topbar "${monitor}"
	done <<<"$(list-monitors)"
}

function listen-monitor-updates() {
	socat -u "UNIX-CONNECT:${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" - |
		stdbuf -o0 awk -F '>>|,' -e '/^monitoradded>>/{print $2}' |
		xargs -I % "$0" "${MONITOR_PREFIX}%"
}

if [ -z "${1:-}" ]; then
	open-on-all-monitors
	listen-monitor-updates
elif [[ ${1} =~ ^${MONITOR_PREFIX} ]]; then
	sleep 1
	open-topbar "${1##"${MONITOR_PREFIX}"}"
fi
