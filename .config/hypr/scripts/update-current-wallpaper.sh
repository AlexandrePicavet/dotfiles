#!/usr/bin/env bash

set -euo pipefail

readonly BASEDIR="${HOME}/.config/hypr/user/wallpapers"
readonly CURRENT="${BASEDIR}/current"

declare wallpaper_count
wallpaper_count="$(find "${BASEDIR}" -maxdepth 1 -type f -not -name '.*' | wc -l)"
readonly wallpaper_count

if [ "${wallpaper_count}" -eq 0 ]; then
	sleep 5
	notify-send 'Missing wallpapers' "You can put wallpapers into the directory: ${BASEDIR}"
	return 1
fi

declare current_wallpaper
current_wallpaper="$(readlink "${CURRENT}" || echo "")"
readonly current_wallpaper

declare new_wallpaper
new_wallpaper="$(find \
	"${BASEDIR}" \
	-maxdepth 1 \
	-type f \
	-not -name '.*' \
	-not -name "$(basename "${current_wallpaper}")" \
		| sort --random-sort \
		| head -n1 \
)"
readonly new_wallpaper


echo "Changing wallpaper to: $(basename "${new_wallpaper}")."

ln -fs "${new_wallpaper}" "${CURRENT}"

hyprctl hyprpaper preload "${new_wallpaper}" &>/dev/null
hyprctl hyprpaper wallpaper ",${new_wallpaper}" &>/dev/null
hyprctl hyprpaper unload all &>/dev/null
