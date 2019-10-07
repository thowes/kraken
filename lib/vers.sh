#!/bin/bash
vers_w() {
	if [ -d $KR_DIR_CFG/versions/ ]; then
		case $1 in
			apache) apache2 -v  > $KR_DIR_CFG/versions/$1.txt;;
			git) git --version > $KR_DIR_CFG/versions/$1.txt;;
			heroku) heroku version > $KR_DIR_CFG/versions/$1.txt;;
			kraken) svn info ~/proj/kraken|grep Revision > $KR_DIR_CFG/versions/$1.txt;;
			mysql) mysql -V > $KR_DIR_CFG/versions/$1.txt;;
			php) php -v > $KR_DIR_CFG/versions/$1.txt;;
			psql) psql -V > $KR_DIR_CFG/versions/$1.txt;;
			python) python -V > $KR_DIR_CFG/versions/$1.txt;;
			rsync) rsync --version|grep version > $KR_DIR_CFG/versions/$1.txt;;
			rails) rails --version > $KR_DIR_CFG/versions/$1.txt;;
			ruby) ruby -v > $KR_DIR_CFG/versions/$1.txt;;
			svn) svn help|grep client > $KR_DIR_CFG/versions/$1.txt;;
			wget) wget -V|grep ggdb|grep lib > $KR_DIR_CFG/versions/$1.txt;;
			*) virhe VERS "parametria ei tunnistettu!";;
		esac
	fi
}

vers() {
	case $1 in
		-v*) if [ -f $KR_DIR_CFG/versions/$2.txt ]; then cat $KR_DIR_CFG/versions/$2.txt; else; virhe VERS "Parametre $2 not recognized!"; fi;;
		-w*) nada;;
		*)
	if [ -f $KR_DIR_CFG/versions/$1.txt ]; then
		cat $KR_DIR_CFG/versions/$1.txt
	else
		virhe VERS "Parametria ei tunnistettu!"
	fi;;
	esac
}
