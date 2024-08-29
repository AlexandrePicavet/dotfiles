# TODO
# https://unix.stackexchange.com/a/626223
# https://jdhao.github.io/2021/03/24/zsh_history_setup/

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=9223372036854775807
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP

