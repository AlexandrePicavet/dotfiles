mkdir -p ~/.local/share/hypr || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/hypr directory'
	return ${code}
}

touch ~/.local/share/hypr/theme.conf || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/hypr/theme.conf file'
	return ${code}
}

cat <<'EOF' > ~/.local/share/hypr/theme.conf
	$THEME = dark
EOF
