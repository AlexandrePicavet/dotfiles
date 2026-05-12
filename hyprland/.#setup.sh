readonly HYPR_LOCAL_SHARE_DIR="${HOME}/.local/share/hypr"
readonly HYPR_THEME_CONFIG="${HYPR_LOCAL_SHARE_DIR}/theme.conf"

mkdir -p "${HYPR_LOCAL_SHARE_DIR}" || {
	declare -ri code=$?
	error "Failed to create the ${HYPR_LOCAL_SHARE_DIR} directory"
	return ${code}
}

## Theme Setup ##

touch "${HYPR_THEME_CONFIG}" || {
	declare -ri code=$?
	error "Failed to create the ${HYPR_THEME_CONFIG} file"
	return ${code}
}

cat <<'EOF' >~/.local/share/hypr/theme.conf
	$THEME = dark
EOF

## Wallpapers Setup ##

readonly HYPR_WALLPAPER_DESTINATION_DIR="${HYPR_LOCAL_SHARE_DIR}/wallpapers"
readonly HYPR_DEFAULT_WALLPAPER_DIR="${HOME}/.config/hypr/default-wallpapers"

mkdir -p "${HYPR_WALLPAPER_DESTINATION_DIR}" || {
	declare -ri code=$?
	error "Failed to create the ${HYPR_WALLPAPER_DESTINATION_DIR} directory"
	return ${code}
}

# If the wallpaper destination directory is empty, copy the default wallpapers to it
[ "$(ls -A "${HYPR_WALLPAPER_DESTINATION_DIR}")" ] || {
	cp -a "${HYPR_DEFAULT_WALLPAPER_DIR}"/* "${HYPR_WALLPAPER_DESTINATION_DIR}"/ || {
		declare -ri code=$?
		error "Failed to copy default wallpapers from ${HYPR_DEFAULT_WALLPAPER_DIR} to ${HYPR_WALLPAPER_DESTINATION_DIR}"
		return ${code}
	}
}
