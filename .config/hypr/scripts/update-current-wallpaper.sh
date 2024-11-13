#!/bin/bash

set -e

readonly BASEDIR="${HOME}/.config/hypr/user/wallpapers"
readonly CURRENT="${BASEDIR}/current"

new_wallpaper="$(find "${BASEDIR}" -maxdepth 1 -type f -not -name '.*' | sort --random-sort | head -n1)"

if [ -z "${new_wallpaper}" ]; then
	sleep 5
	notify-send 'Missing wallpapers' "You can put wallpapers into the directory: ${BASEDIR}"
else
	ln -fs "${new_wallpaper}" "${CURRENT}"
fi


