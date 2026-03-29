#!/usr/bin/env bash

mkdir -p ~/.local/share/delta || {
	declare -ri code=$?
	error 'Failed to create the ~/.local/share/delta directory'
	return ${code}
}

cat <<'EOF' > ~/.local/share/delta/theme.gitconfig
[delta]
	features = catppuccin-macchiato
EOF
