#!/bin/bash

# I use this function to check if a command exists already 
# as an alias, as an exetable within PATH, or as a man page
# so that I don't name a new command as something that already exists.
olemassa() {}
	if [ "_$1_" != "__" ]; then 
		kaiku WHICH $1; which $1
		kaiku MAN $1; man -w $1
		# this will only work correctly in a function
		kaiku ALIAS "$1"; \alias "$1"
	else
		virhe Missing argument.
	fi
}
