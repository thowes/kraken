#!/bin/bash
if [ -f $KR_DIR_CFG/nets.sh ]; then
	VERKKO_IP="0.0.0.0"
	VERKKO_ESSID="NADA"
	VERKKO_MAC="NADA"
	# Contents of KAYTTIS variable are defined in ymp.sh, to recognize the OS.
	# Different network commands are available in different OSes.
	case $KAYTTIS in
		cygwin)
			# Using windows networks commands
			VERKKO_IP=$(ipconfig|\grep IPv4)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(netsh wlan show interfaces|\grep SSID|\grep -v BSSID); else VERKKO_ESSID=nada; fi
			;;
		darwin)
			# Using macos networks commands.
			VERKKO_IP=$(ifconfig|\grep broadcast)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(airport -I|\grep SSID|\grep -v BSSID); else VERKKO_ESSID=nada; fi
			;;
		ubuntu)
			# Using unix/linux/ubuntu networks commands.
			VERKKO_IP=$(ifconfig eth0|\grep Bcast)
			if [ $KR_WIRELESS == "true" ]; then VERKKO_ESSID=$(iwlist wlan0 scan|\grep ESSID); else VERKKO_ESSID=nada; fi
			;;
	esac
	. $KR_DIR_CFG/nets.sh
else virhe FILE nets.sh not found; fi

# not working properly in some cases
verkko() {
	case $KAYTTIS in
		cygwin)
			case $1 in
				eth) netsh lan show interfaces;;
				ext) \curl $KRN_EXT_IP_ADDRESS;;
				ip) ipconfig|\grep IPv4;;
				mac) getmac /v;;
				ssid) netsh wlan show interfaces|\grep SSID|\grep -v BSSID;;
				wlan) netsh wlan show interfaces;;
				*) ipconfig /all;;
			esac;;
		darwin)
			case $1 in
				eth) ifconfig eth0;;
				ext) \curl $KRN_EXT_IP_ADDRESS;;
				ip) ifconfig|\grep broadcast;;
				mac) ifconfig -a|\grep HWaddr;;
				ssid) airport -I|\grep -v BSSID|\grep SSID;;
				wlan) ifconfig wlan0;;
				*) ifconfig -a;;
			esac
			;;
		ubuntu)
			case $1 in
				eth) ifconfig eth0;;
				ext) \curl $KRN_EXT_IP_ADDRESS;;
				ip) ifconfig -a|\grep Bcast;;
				mac) ifconfig -a|\grep HWaddr;;
				ssid) iwlist wlan0 scan|\grep ESSID;;
				wlan) ifconfig wlan0;;
				*) ifconfig -a;;
			esac
			;;
		*) echo "[[ KRAKEN/VERKKO err2: $KAYTTIS ei tunnistettu/tuettu! ]]";;
	esac
}
