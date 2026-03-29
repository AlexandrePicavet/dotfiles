#!/usr/bin/env bash

mkdir -p ~/.local/share/zsh/theming || {
	declare -ri code=$?
	error 'Failed to create the zsh ~/.local/share/zsh/theming directory'
	return ${code}
}

touch ~/.user.zshenv || {
	declare -ri code=$?
	error 'Failed to create the ~/.user.zshenv file'
	return ${code}
}
