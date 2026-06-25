#!/usr/bin/env bash

touch ~/.user.gitconfig || {
	declare -ri code=$?
	error 'Failed to create the .user.gitconfig file'
	return ${code}
}

mkdir -p ~/.config/git || {
	declare -ri code=$?
	error 'Failed to create the .config/git directory'
	return ${code}
}

{
	echo -n >~/.config/git/attributes
	find "$(git rev-parse --show-toplevel)" -name '*.gitattributes' -exec cat '{}' + >>~/.config/git/attributes
} || {
	declare -ri code=$?
	error 'Failed to merge gitattributes files into the .config/git/attributes'
	return ${code}
}
