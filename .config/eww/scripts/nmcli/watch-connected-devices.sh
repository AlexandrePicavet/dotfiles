#!/usr/bin/env bash

set -euo pipefail

(echo "connected"; nmcli d m) |
	stdbuf -o0 sed -n '/connected$/p' |
	while read; do
		devices="$(
			jc nmcli d s |
				jq -r '[.[] | select((.state == "connected") and (.type | IN("wifi", "wireguard", "ethernet"))) | {type, connection}]'
		)"

		# TODO make another call to add the signal strength to the wifi device if connected.
		eww update devices-wifi="$(echo ${devices} | jq -r '[.[] | select(.type == "wifi")]')"
		eww update devices-wireguard="$(echo ${devices} | jq -r '[.[] | select(.type == "wireguard")]')"
		eww update devices-ethernet="$(echo ${devices} | jq -r '[.[] | select(.type == "ethernet")]')"
	done
