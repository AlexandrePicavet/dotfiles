#!/usr/bin/env bash

mkdir -p ~/.local/share/zsh/theming || {
	declare -ri code=$?
	error "Failed to create the zsh theming directory"
	return ${code}
}
