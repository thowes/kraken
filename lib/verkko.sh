#!/bin/bash
if [ $(asetus bool:hosted) != "true" ]; then
	VERKKO_IP=$(verkko ip)
	if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
	if [ -f $KR_DIR_CFG/nets.sh ]; then
	# Contents of KAYTTIS variable are defined in ymp.sh, to recognize the OS.
	# Different network commands are available in different OSes.
	case $KAYTTIS in
		cygwin) # Using windows networks commands
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
			;;
		darwin) # Using macos networks commands.
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
			;;
		linux|ubuntu) # Using unix/linux/ubuntu networks commands.
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
			;;
	esac
		. $KR_DIR_CFG/nets.sh
	else virhe FILE nets.sh not found; fi
fi
