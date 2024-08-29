# https://github.com/MichaelAquilina/zsh-auto-notify?tab=readme-ov-file#configuration

AUTO_NOTIFY_THRESHOLD=10
AUTO_NOTIFY_EXPIRE_TIME=5000
AUTO_NOTIFY_IGNORE=("v" "vim" "nvim" "ssh" "htop" "docker" "git" "man" "less" "sudo" "tmux")
AUTO_NOTIFY_TITLE="Hey! %command has just finished"
AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
