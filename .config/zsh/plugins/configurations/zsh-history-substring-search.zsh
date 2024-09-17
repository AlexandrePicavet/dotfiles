# https://github.com/zsh-users/zsh-history-substring-search?tab=readme-ov-file#usage

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=green,fg=black,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=red,fg=black,bold"

bindkey '^[[A' history-substring-search-up
bindkey '\eOA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '\eOB' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
