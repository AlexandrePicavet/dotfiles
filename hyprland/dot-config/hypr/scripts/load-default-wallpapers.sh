#!/usr/bin/env bash

set -euo pipefail

readonly DEFAULT_WALLPAPER_DIR="${HOME}/.config/hypr/default-wallpapers"
readonly WALLPAPER_DESTINATION_DIR="${HOME}/.local/share/hypr/wallpapers"

mkdir -p "${WALLPAPER_DESTINATION_DIR}"

[ "$(ls "${WALLPAPER_DESTINATION_DIR}")" ] ||
	cp -a "${DEFAULT_WALLPAPER_DIR}"/* "${WALLPAPER_DESTINATION_DIR}"/
