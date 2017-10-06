#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri new "KRAKEN/VERKKO /w"; fi

if [ -f $KR_DIR_CFG/nets.sh ]; then
	VERKKO_DNS="NADA"
	VERKKO_IP="NADA"
	VERKKO_ESSID="NADA"
	VERKKO_MAC="NADA"
	# Contents of KAYTTIS variable are defined in ymp.sh, to recognize the OS.
	# Different network commands are available in different OSes.
	case $KAYTTIS in
		cygwin)
			# Using windows networks commands
			VERKKO_IP=$(ipconfig|grep IPv4)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(netsh wlan show interfaces|grep SSID|grep -v BSSID); else VERKKO_ESSID=nada; fi
			;;
		darwin)
			# Using macos networks commands.
			VERKKO_IP=$(ifconfig|grep broadcast)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(airport -I|grep SSID|grep -v BSSID); else VERKKO_ESSID=nada; fi
			;;
		hosted)
			VERKKO_IP="0.0.0.0"
			VERKKO_ESSID="NADA"
			;;
		ubuntu)
			# Using unix/linux/ubuntu networks commands.
			VERKKO_IP=$(ifconfig eth0|grep Bcast)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(iwlist wlan0 scan|grep ESSID); else VERKKO_ESSID=nada; fi
			;;
		*) virhe VERKKO "$KAYTTIS not supported or recognized!";;
	esac
	. $KR_DIR_CFG/nets.sh
else virhe nets.sh not found
fi

if [ $KR_DEBUG == "true" ]; then tynnyri $VERKKO; tynnyri kick; fi

# not working properly in some cases
verkko() {
	case $KAYTTIS in
		cygwin)
			case $1 in
				arp) arp -a;;
				dns) ipconfig|grep "DNS Suffix Search List";;
				eth) netsh lan show interfaces;;
				ext) curl http://ipinfo.io/ip;;
				ip) ipconfig|grep IPv4;;
				lan) netsh lan show interfaces;;
				mac) getmac /v;;
				ssid) netsh wlan show interfaces|grep SSID|grep -v BSSID;;
				wlan) netsh wlan show interfaces;;
				*) ipconfig /all;;
			esac;;
		darwin)
			case $1 in
				eth) ifconfig eth0;;
				ext) curl http://ipinfo.io/ip;;
				ip) ifconfig|grep broadcast;;
				lan) ifconfig eth0;;
				mac) ifconfig -a|grep HWaddr;;
				ssid) airport -I|grep -v BSSID|grep SSID;;
				wlan) ifconfig wlan0;;
				*) ifconfig -a;;
			esac
			;;
		ubuntu)
			case $1 in
				arp) arp -a;;
				eth) ifconfig eth0;;
				ext) curl http://ipinfo.io/ip;;
				ip) ifconfig -a|grep IP;;
				lan) ifconfig eth0;;
				mac) ifconfig -a|grep HWaddr;;
				ssid) iwlist wlan0 scan|grep ESSID;;
				wlan) ifconfig wlan0;;
				*) ifconfig -a;;
			esac
			;;
		*) echo "[[ KRAKEN/VERKKO err2: $KAYTTIS ei tunnistettu/tuettu! ]]";;
	esac
}
