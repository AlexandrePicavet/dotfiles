if check_install -o systemctl; then
	alias sys='systemctl'

	alias syssus='sys suspend'
	alias syshib='sys hibernate'
	alias sysrb='sys reboot'
	alias syspo='sys poweroff'

	alias sysst='sys status'
	if check_install -o sudo; then
		alias sysstart='sudo sys start'
		alias sysstop='sudo sys stop'
		alias sysrs='sudo sys restart'
	fi

	alias usys='sys --user'

	alias usysst='usys status'
	alias usysstart='usys start'
	alias usysstop='usys stop'
	alias usysrs='usys restart'
fi
