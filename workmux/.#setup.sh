#!/usr/bin/env bash

readonly WORKMUX_CONFIG_DIR="${HOME}/.config/workmux"

mkdir -p "${WORKMUX_CONFIG_DIR}" || {
	declare -ri code=$?
	error "Failed to create the ${WORKMUX_CONFIG_DIR} directory"
	return ${code}
}
