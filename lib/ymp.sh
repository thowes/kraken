#!/bin/bash
#ymp.sh, L 2.4.2013
KAYTTIS=$(uname)

if [ KR_HOSTED == "true" ]; then KAYTTIS="hosted"
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
				*kapsi*) KAYTTIS=linux;;
				*Mint*) KAYTTIS=mint;;
				*Ubuntu*) KAYTTIS=ubuntu;;
				*) KAYTTIS=linux;;
			esac
			;;
		*) kaiku KRAKEN/YMP $KAYTTIS "ei tunnistettu!";;
	esac
fi

if [ $VERBOSITY -ge $LEV_V ]; then kaiku KRAKEN/YMP $KAYTTIS; fi
