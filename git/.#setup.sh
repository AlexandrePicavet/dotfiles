#!/usr/bin/env bash

touch ~/.user.gitconfig || {
	declare -ri code=$?
	error 'Failed to create the .user.gitconfig file'
	return ${code}
}
