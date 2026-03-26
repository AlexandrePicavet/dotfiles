# https://github.com/mattmc3/antidote

# Local Share
PLUGIN_MANAGER_DIR="${ZSHAREDIR}/antidote"
PLUGINS_INSTALL_DIR="${ZSHAREDIR}/plugins"
PLUGINS_LOAD_FILE="${ZSHAREDIR}/plugins_list.zsh"

# Configuration
PLUGIN_MANAGER="${PLUGIN_MANAGER_DIR}/antidote.zsh"
PLUGINS_DIR="${ZDOTDIR}/plugins"
PLUGINS_CONFIGURATION_DIR="${PLUGINS_DIR}/configurations"
PLUGINS_LIST="${PLUGINS_DIR}/plugins_list.txt"

[[ -d "${PLUGINS_INSTALL_DIR}" ]] || mkdir -p "${PLUGINS_INSTALL_DIR}"

[ -d "${PLUGIN_MANAGER_DIR}" ] || {
	git clone --depth=1 https://github.com/mattmc3/antidote.git "${PLUGIN_MANAGER_DIR}"
	clear
}

[[ "${PLUGINS_LOAD_FILE}" -nt "${PLUGINS_LIST}" ]] || (
	source "${PLUGIN_MANAGER}"
	antidote bundle <"${PLUGINS_LIST}" >"${PLUGINS_LOAD_FILE}"
)
source "${PLUGINS_LOAD_FILE}"

for configuration in "${PLUGINS_CONFIGURATION_DIR}"/*; do
	source "${configuration}"
done
