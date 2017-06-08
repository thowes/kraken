#!/bin/bash
#ymp.sh, L 2.4.2013
KAYTTIS=$(uname)

# Based on the contents of the uname ouput string, recognizes the OS.
# Only cygwin and ubuntu are tested to work properly.
if [ $HOSTED == "true" ]; then KAYTTIS="hosted"
else
	case $KAYTTIS in
		*Darwin*)
			KAYTTIS=darwin
			;;
		*CYGWIN*)
			KAYTTIS=cygwin
			;;
		*BSD*)
			KAYTTIS=bsd
			;;
		*Linux*)
			KAYTTIS_FULL=$(uname -a)
			case $KAYTTIS_FULL in
				*Mint*) KAYTTIS=mint;;
				*Ubuntu*) KAYTTIS=ubuntu;;
				*) KAYTTIS=linux;;
			esac
			;;
		*) kaiku KRAKEN/YMP $KAYTTIS "ei tunnistettu!";;
	esac
fi

if [ $KR_DEBUG == "true" ]; then kaiku KRAKEN/YMP $KAYTTIS; fi
