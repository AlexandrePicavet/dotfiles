#!/usr/bin/env bash

readonly HERDR_CONFIG_DIR="${HOME}/.config/herdr"

mkdir -p "${HERDR_CONFIG_DIR}" || {
	declare -ri code=$?
	error "Failed to create the ${HERDR_CONFIG_DIR} directory"
	return ${code}
}
