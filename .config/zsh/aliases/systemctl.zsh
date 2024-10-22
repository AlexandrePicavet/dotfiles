if check_install systemctl; then
	alias sysctl='systemctl'

	alias syssus='sysctl suspend'
	alias syshib='sysctl hibernate'
	alias sysrb='sysctl reboot'
	alias syspo='sysctl poweroff'

	alias sysst='sysctl status'
	if check_install sudo; then
		alias sysstart='sudo sysctl start'
		alias sysstop='sudo sysctl stop'
		alias sysrs='sudo sysctl restart'
	fi

	alias usysctl='sysctl --user'

	alias usysst='usysctl status'
	alias usysstart='usysctl start'
	alias usysstop='usysctl stop'
	alias usysrs='usysctl restart'
fi
