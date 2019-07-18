#!/bin/bash

# Based on the contents of the uname ouput string, recognizes the OS.
# Only cygwin, darwin and ubuntu are tested to work properly.
kayttis() {
	KAYTTIS_FULL=$(uname -a)
	if [ $KR_HOSTED == "false" ]; then case $KAYTTIS_FULL in
		*BSD*) KAYTTIS_SHORT=bsd;;
		*CYGWIN*) KAYTTIS_SHORT=cygwin;;
		*Darwin*) KAYTTIS_SHORT=darwin;;
		*Haiku*) KAYTTIS_SHORT=haiku;;
		*Linux*)
			case $KAYTTIS_FULL in
				*Debian*) KAYTTIS_SHORT=debian;;
				*Ubuntu*) KAYTTIS_SHORT=ubuntu;;
				*) KAYTTIS_SHORT=linux;;
			esac
			;;
		*) kaiku KRAKEN/YMP $KAYTTIS "not recognized!";;
	esac; else KAYTTIS_SHORT=hosted; fi
	echo $KAYTTIS_SHORT
}

#KAYTTIS=$(kayttis)
