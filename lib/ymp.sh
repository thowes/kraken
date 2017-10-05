#!/bin/bash
KAYTTIS="hosted"
KAYTTIS_FULL=$(uname -a)

# Based on the contents of the uname ouput string, recognizes the OS.
# Only cygwin, darwin and ubuntu are tested to work properly.
if [ $KR_HOSTED == "false" ]; then
	case $KAYTTIS_FULL in
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
			#KAYTTIS_FULL=$(uname -a)
			case $KAYTTIS_FULL in
				*debian*) KAYTTIS=debian;;
				*Mint*) KAYTTIS=mint;;
				*Ubuntu*) KAYTTIS=ubuntu;;
				*) KAYTTIS=linux;;
			esac
			;;
		*) kaiku KRAKEN/YMP $KAYTTIS "ei tunnistettu!";;
	esac
fi

if [ $KR_DEBUG == "true" ]; then kaiku KRAKEN/YMP $KAYTTIS; fi
