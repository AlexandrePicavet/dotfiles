function nvim-theme() {
	which nvim &>/dev/null || return 0

	local NVIM_PIPE_PATH
	NVIM_PIPE_PATH="/run/user/$(id -u)/nvim.pipe"
	readonly NVIM_PIPE_PATH

	[ -e "${NVIM_PIPE_PATH}" ] || return 0

	local -r LIGHT_THEME='latte'
	local -r DARK_THEME="macchiato"

	local -r CONFIG_FILE=~/.config/nvim/lua/plugins/catppuccin.lua
	local -r LIGHT_THEME_MATCH="flavour = \"${LIGHT_THEME}\""
	local -r DARK_THEME_MATCH="flavour = \"${DARK_THEME}\""

	local THEME
	THEME="${1}"
	readonly THEME

	_theme_helper "${CONFIG_FILE}" "${LIGHT_THEME_MATCH}" "${DARK_THEME_MATCH}" "${THEME}"

	_custom_theme_helper \
		"/usr/bin/nvim --server ${NVIM_PIPE_PATH} --remote-send ':Catppuccin latte<CR>'" \
		"/usr/bin/nvim --server ${NVIM_PIPE_PATH} --remote-send ':Catppuccin macchiato<CR>'" \
		"${THEME}"
}
