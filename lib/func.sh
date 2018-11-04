#!/bin/bash

# I use this function to check if a command exists already 
# as an alias, as an exetable within PATH, or as a man page
# so that I don't name a new command as something that already exists.
olemassa() {
	kaiku MAN $1; man -w $1
	kaiku WHICH $1; which $1
	kaiku ALIAS $1; alias $1
}
