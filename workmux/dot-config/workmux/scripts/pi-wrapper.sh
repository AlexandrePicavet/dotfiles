#!/usr/bin/env bash

which pi &>/dev/null || {
	echo "Pi Coding Agent is not installed. Exiting..."
	exit 1
}

[ -f 'devenv.nix' ] && which devenv &>/dev/null && exec devenv shell -- "pi ${@}"

[ -f 'shell.nix' ] && which nix-shell &>/dev/null && exec nix-shell shell.nix --command "pi ${@}"

exec pi ${@}
