# https://github.com/MichaelAquilina/zsh-auto-notify?tab=readme-ov-file#configuration

AUTO_NOTIFY_THRESHOLD=10
AUTO_NOTIFY_EXPIRE_TIME=5000
AUTO_NOTIFY_IGNORE=("v" "vim" "nvim" "ssh" "htop" "docker" "git" "man" "less" "sudo" "tmux" "nmtui" "feh")
AUTO_NOTIFY_TITLE="%command has just finished"
AUTO_NOTIFY_BODY="Completed in %elapsed seconds with exit code %exit_code"
