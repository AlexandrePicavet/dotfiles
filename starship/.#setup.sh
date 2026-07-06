#!/usr/bin/env bash

rm -f ~/.config/starship.toml || {
	declare -ri code=$?
	error 'Failed to remove the starship configuration'
	return ${code}
}
