#!/bin/bash
# https://wiki.hyprland.org/Useful-Utilities/Status-Bars/#configewwscriptsget-active-workspace

set -euo pipefail

hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'

socat -u "UNIX-CONNECT:${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" - |
	stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/{print $2}' -e '/^focusedmon>>/{print $3}'
