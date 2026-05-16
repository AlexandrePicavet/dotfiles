if check_install -o udisksctl; then
	alias umb='udisksctl mount -b'
	alias uub='udisksctl unmount -b'
fi
