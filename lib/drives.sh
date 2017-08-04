#!/bin/bash
#drives.sh, L 24.5.2007
if [ $KR_DEBUG == "true" ]; then tynnyri DRIVES; fi

ker_usb_drives() {
	if [ $KR_DEBUG == "true" ]; then tynnyri new DRV; fi
	N=0
	for f in $(cat $KR_DIR_CFG/usb.lst); do
		if [ -f $f ]; then
			N=$(($N+1))
			. $f
			if [ $N == 5 ]; then N=0; 
				if [ $KR_DEBUG == "true" ]; then tynnyri kick; tynnyri new DRV; fi
			fi
		fi
	done
	if [ $KR_DEBUG == "true" ]; then tynnyri kick; fi
}