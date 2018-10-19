#!/bin/bash

# I use this function to check if command exists already 
# as an alias, as an exetable within path, or as a man page
# so that I don't name new command as something that already exists.
olemassa() {
	kaiku MAN $1; man -w $1
	kaiku WHICH $1; which $1
	kaiku ALIAS $1; alias $1
}

# this function gives md5 and sha256 checksums for individual as output"
summa() {
	case $KAYTTIS in
		darwin) echo $(md5 $1|awk -F= '{print $2}'),$(shasum -a 256 $1|awk '{print $1}');;
		*) echo $(md5sum $1|awk '{print $1}'),$(sha256sum $1|awk '{print $1}');;
	esac
}