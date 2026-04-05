mkdir -p ~/.local/share/nvim || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/nvim directory'
	return ${code}
}

touch ~/.local/share/nvim/theme.lua || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/nvim/theme.lua file'
	return ${code}
}

cat <<'EOF' > ~/.local/share/nvim/theme.lua
return "macchiato"
EOF
