#!/bin/bash
if [ $(asetus bool:hosted) != "true" ]; then
	VERKKO_IP=$(verkko ip)
	if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
	if [ -f $KR_DIR_CFG/nets.sh ]; then
	#case $KAYTTIS in
		#darwin) # Using macos networks commands.
		if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(verkko ssid); else VERKKO_ESSID=nada; fi
			#;;
	#esac
		. $KR_DIR_CFG/nets.sh
	else
		virhe FILE nets.sh not found
	fi
fi
