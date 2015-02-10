#!/bin/bash
#drives.sh, L 24.5.2007
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri DRIVES; fi

ker_usb_drives() {
	tynnyri new DRV
	N=0
	for f in $(cat $KR_DIR_HOST/usb.lst); do
		if [ -f $f ]; then
			N=$(($N+1))
			. $f
			if [ $N == 5 ]; then N=0; tynnyri kick; tynnyri new DRV; fi
		fi
	done
	tynnyri kick
}