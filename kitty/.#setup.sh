mkdir -p ~/.local/share/kitty || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/kitty directory'
	return ${code}
}

touch ~/.local/share/kitty/theme.conf || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/kitty/theme.conf file'
	return ${code}
}

cat <<'EOF' > ~/.local/share/kitty/theme.conf
	include ~/.config/kitty/themes/catppuccin-macchiato.conf
EOF
