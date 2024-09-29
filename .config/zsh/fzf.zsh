#!/usr/bin/zsh

FZF_LIGHT_COLOR='bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39,fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78,marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39,selected-bg:#bcc0cc'
FZF_DARK_COLOR='bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796,fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6,marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796,selected-bg:#494d64'

FZF_COLOR="${FZF_DARK_COLOR}"

export FZF_COLOR
export FZF_DEFAULT_OPTS="--color='${FZF_COLOR}' --multi"

