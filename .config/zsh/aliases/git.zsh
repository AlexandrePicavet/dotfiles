check_install delta
if check_install git; then
	alias g='git'
	alias ga='git add'
	alias gap='ga -p'
	alias gA='ga -A'
	alias gAc='gA && gc'
	alias gAca='gA && gca'
	alias gAcane='gA && gcane'
	alias gAcanep='gAcane && gp'
	alias gAcanepf='gAcane && gpf'
	alias gAcap='gAca && gp'
	alias gAcapf='gAca && gpf'
	alias gAcm='gA && gcm'
	alias gArc='gA && grc'
	alias gb='g branch'
	alias gba='gb -a'
	alias gbm='gb -m'
	alias gc='g commit'
	alias gca='gc --amend'
	alias gcane='gca --no-edit'
	alias gcanepf='gcane && gpf'
	alias gcapf='gca && gpf'
	alias gcdf='g clean -df'
	alias gcl='g clone'
	alias gcm='gc -m'
	alias gcp='gc && gp'
	alias gcpf='gc && gpf'
	alias gd='g diff --color=always'
	alias gdh='gd HEAD'
	alias gf='g fetch'
	alias gfr='gf && gr'
	alias gg='g log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'
	alias gl='g log --color --show-signature'
	alias gld='gl -p'
	alias glf='gl --stat'
	alias gm='g merge'
	alias gma='gm --abort'
	alias gmc='gm --continue'
	alias gp='g push'
	alias gpf='gp --force-with-lease'
	alias gr='g rebase'
	alias gra='gr --abort'
	alias grc='gr --continue'
	alias grest='g restore'
	alias gri='gr -i'
	alias grst='g reset'
	alias grsth='grst --hard'
	alias gs='gsl -sb'
	alias gsh='g show'
	alias gsl='g status'
	alias gst='g stash'
	alias gsta='gst apply'
	alias gstb='gst branch'
	alias gstd='gstf --full-index'
	alias gstf='gst show'
	alias gstl='gst list'
	alias gstp='gst pop'
	alias gsw='g switch'
	alias gswc='gfr;gsw -c'
	alias gu='ga -u'
	alias guc='gu && gc'
	alias guca='gu && gca'
	alias gucane='gu && gcane'
	alias gucanep='gucane && gp'
	alias gucanepf='gucane && gpf'
	alias gucap='guca && gp'
	alias gucapf='guca && gpf'
	alias gucm='gu && gcm'
	alias gurc='gu && grc'
fi
