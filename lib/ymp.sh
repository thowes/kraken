#!/bin/bash
KAYTTIS="hosted"
KAYTTIS_FULL=$(uname -a)

# Based on the contents of the uname ouput string, recognizes the OS.
# Only cygwin, darwin and ubuntu are tested to work properly.
kayttis() {
	if [ $KR_HOSTED == "false" ]; then case $KAYTTIS_FULL in
		*BSD*) KAYTTIS=bsd;;
		*CYGWIN*) KAYTTIS=cygwin;;
		*Darwin*) KAYTTIS=darwin;;
		*Haiku*) KAYTTIS=haiku;;
		*Linux*)
			case $KAYTTIS_FULL in
				*Debian*) KAYTTIS=debian;;
				*Ubuntu*) KAYTTIS=ubuntu;;
				*) KAYTTIS=linux;;
			esac
			;;
		*) kaiku KRAKEN/YMP $KAYTTIS "not recognized!";;
	esac; fi
}

kayttis

if [ $KR_DEBUG == "true" ]; then kaiku KRAKEN/YMP $KAYTTIS; fi
