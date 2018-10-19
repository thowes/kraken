#!/bin/bash

# I use this function to check if a command exists already 
# as an alias, as an exetable within PATH, or as a man page
# so that I don't name a new command as something that already exists.
olemassa() {
	kaiku MAN $1; man -w $1
	kaiku WHICH $1; which $1
	kaiku ALIAS $1; alias $1
}

# pvm is short for päivämäärä ('calendar date' in Finnish).
# Takes datetime information as input.
# gives full YYYY-MM-DD HH:MM:SS.xyz as output.
# the part missing from input is generated based on the current time.
pvm() {
	if [ "$1" != "" ]; then
		if [ "$2" != "" ]; then
			KR_SEC=$(echo $2 | awk -F\: '{print $3}')
			if [ "$KR_SEC" != "" ]; then echo $1 $2.$(date +"%N")
			else echo $1 $2:$(date +"%S.%N"); fi
		else echo $1 $(date +"%T.%N"); fi
	else date +"%F %T.%N"; fi
}

# this function gives md5 and sha256 checksums for individual as output"
summa() {
	case $KAYTTIS in
		darwin) echo $(md5 $1|awk -F= '{print $2}'),$(shasum -a 256 $1|awk '{print $1}');;
		*) echo $(md5sum $1|awk '{print $1}'),$(sha256sum $1|awk '{print $1}');;
	esac
}