#!/bin/bash
# https://wiki.hyprland.org/Useful-Utilities/Status-Bars/#configewwscriptsget-window-title

set -euo pipefail

hyprctl activewindow -j | jq --raw-output .title | sed 's/null//'

socat -u "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - |
	stdbuf -o0 awk -F '>>|,' '/^activewindow>>/{print $3}'
