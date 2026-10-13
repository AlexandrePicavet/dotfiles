#!/usr/bin/env bash

[ -z "${WORKMUX_AGENT}" ] && {
	echo "Missing WORKMUX_AGENT environment variable. Exiting..."
	exit 1
}

which "${WORKMUX_AGENT}" &>/dev/null || {
	echo "'${WORKMUX_AGENT}' command is not available. Exiting..."
	exit 1
}

[ -f 'devenv.nix' ] && which devenv &>/dev/null && exec devenv shell -- "'${WORKMUX_AGENT}' ${@}"

[ -f 'shell.nix' ] && which nix-shell &>/dev/null && exec nix-shell shell.nix --command "${WORKMUX_AGENT} ${@}"

exec "${WORKMUX_AGENT}" ${@}
