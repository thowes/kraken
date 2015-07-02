#!/bin/bash
#muok.sh, L 25.3.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri MUOK; fi
EDITOR='nano -w -T 2'

muokkaa() {
  EDITOR='nano -w -T 2'
	case $1 in
		em) EDITOR=emacs; . ~/$KR_DIR_CFG/eds.sh $2 $3;;
		emacs) EDITOR=emacs; . ~/$KR_DIR_CFG/eds.sh $2 $3;;
		n) EDITOR=nano; . ~/$KR_DIR_CFG/eds.sh $2 $3;;
		*) . ~/$KR_DIR_CFG/eds.sh $1 $2;;
	esac
	EDITOR='nano -w -T 2'
}

muokkaa_drives() {
	if [ -d /cygdrive/$1 ] && [ -f ~/$KR_DIR_CFG/usb.lst ]; then
		for f in $(ls /cygdrive/$1|grep sh); do
			for d in $(cat ~/$KR_DIR_HOST/usb.lst); do
				if [ /cygdrive/$1/$f == $d ]; then $EDITOR $d; fi
			done
		done
	fi
}
