mkdir -p ~/.local/share/tmux || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/tmux directory'
	return ${code}
}

touch ~/.local/share/tmux/theme.conf || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/tmux/theme.conf file'
	return ${code}
}

cat <<'EOF' > ~/.local/share/tmux/theme.conf
set -g @catppuccin_flavour 'macchiato'
EOF
