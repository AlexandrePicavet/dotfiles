#!/usr/bin/env bash

mkdir -p ~/.local/share/delta || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/delta directory'
	return ${code}
}

touch ~/.local/share/delta/theme.gitconfig || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/delta/theme.gitconfig file'
	return ${code}
}

cat <<'EOF' > ~/.local/share/delta/theme.gitconfig
[delta]
	syntax-theme = Catppuccin Macchiato
EOF
