#!/bin/bash
#unpak.sh, L 6.3.2015
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri UNPAK; fi

unpak_main() {
	case $1 in
		arj) echo "Format is ARJ";;
		gz) echo "Format is GZ";;
		rar) echo "Format is RAR";;
		tar) echo "Format is TAR";;
		tar.gz) echo "Format is TAR.GZ";;
		zip) echo "Format is ZIP";;
		*) echo "Format is unknown";;
	esac
}
