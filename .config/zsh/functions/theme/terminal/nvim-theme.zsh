function nvim-theme() {
	which nvim &>/dev/null || return 0

	local -r LIGHT_THEME='latte'
	local -r DARK_THEME="macchiato"

	local -r CONFIG_FILE=~/.config/nvim/lua/plugins/catppuccin.lua
	local -r LIGHT_THEME_MATCH="flavour = \"${LIGHT_THEME}\""
	local -r DARK_THEME_MATCH="flavour = \"${DARK_THEME}\""

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	# Update existing nvim instances colorscheme
	for pipe in $(find "/run/user/$(id -u)" -maxdepth 1 -name "nvim-*.pipe"); do
		_custom_theme_helper \
			"/usr/bin/nvim --server '${pipe}' --remote-send ':Catppuccin latte<CR>' &>/dev/null" \
			"/usr/bin/nvim --server '${pipe}' --remote-send ':Catppuccin macchiato<CR>' &>/dev/null" \
			"${THEME}"
	done
}
