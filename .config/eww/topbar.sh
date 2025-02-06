#!/bin/bash

set -euo pipefail

declare -r LOG_FILE="/tmp/eww-topbar.log"

function log() {
	echo ${*} | tee -a "${LOG_FILE}"
}

function open-topbar() {
	local -r monitor="${1}"
	local -r id="topbar-${monitor}"

	log "Opening topbar with id '${id}' on monitor '${monitor}'..."
	if eww open topbar --id "${id}" --arg "monitor=${monitor}" 1>/dev/null; then
		log -e '\t\e[32mOK\e[0m'
	else
		log -e '\t\e[31mFailed\e[0m'
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
		while read -r monitor; do
			log "monitor: ${monitor}"
			open-topbar "${monitor}"
		done
}

:> ${LOG_FILE}
open-on-all-monitors
listen-monitor-updates
