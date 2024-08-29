PLUGIN_MANAGER_DIR="${ZDOTDIR}/.antidote"
PLUGIN_MANAGER="${PLUGIN_MANAGER_DIR}/antidote.zsh"
PLUGINS_DIR="${ZDOTDIR}/plugins"
PLUGINS_FILE="${PLUGINS_DIR}/plugins_list.txt"
PLUGINS_CONFIGURATION_DIR="${PLUGINS_DIR}/configurations"

if [ ! -d "${PLUGIN_MANAGER_DIR}" ]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git "${PLUGIN_MANAGER_DIR}"
fi

source "${PLUGIN_MANAGER}"
antidote load "${PLUGINS_FILE}"

for configuration in "${PLUGINS_CONFIGURATION_DIR}"/*; do
	source "$configuration"
done
