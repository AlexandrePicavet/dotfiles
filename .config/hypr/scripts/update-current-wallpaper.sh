#!/usr/bin/env bash

set -e

readonly BASEDIR="${HOME}/.config/hypr/user/wallpapers"
readonly CURRENT="${BASEDIR}/current"

declare current_wallpaper
current_wallpaper="$(readlink "${CURRENT}" || echo "")"
readonly current_wallpaper

declare new_wallpaper
while
	new_wallpaper="$(find "${BASEDIR}" -maxdepth 1 -type f -not -name '.*' | sort --random-sort | head -n1)"
	[ "${new_wallpaper}" == "${current_wallpaper}" ]
do true; done
readonly new_wallpaper


if [ -z "${new_wallpaper}" ]; then
	sleep 5
	notify-send 'Missing wallpapers' "You can put wallpapers into the directory: ${BASEDIR}"
else
	echo "Changing wallpaper to: $(basename "${new_wallpaper}")."

	ln -fs "${new_wallpaper}" "${CURRENT}"

	hyprctl hyprpaper preload "${new_wallpaper}" &>/dev/null
	hyprctl hyprpaper wallpaper ",${new_wallpaper}" &>/dev/null
	hyprctl hyprpaper unload all &>/dev/null
fi


