# https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#configure

if check_install fzf; then
	zstyle ':completion:*:descriptions' format '[%d]'
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	zstyle ':completion:*' menu no
	zstyle ':fzf-tab:*' switch-group '<' '>'
	zstyle ':fzf-tab:*' fzf-flags --color="${FZF_COLOR}" --multi

	if check_install tmux; then
		zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
		zstyle ':fzf-tab:*' popup-min-size 100 10
	fi

	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
	zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --color=always $realpath'
	zstyle ':fzf-tab:complete:rm:*' fzf-preview 'eza -1 --color=always $realpath'
	zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status -- $word'
	zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
	zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
	zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
	zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
		fzf-preview 'echo ${(P)word}'
fi
