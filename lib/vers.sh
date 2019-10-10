#!/bin/bash
vers_w() {
	if [ -d $DIR_CFG/versions/ ]; then
		case $1 in
			kraken) svn info ~/proj/kraken|grep Revision > $KR_DIR_CFG/versions/$1.txt;;
			mysql) echo "mysql:" $(mysql -V) >> $DIR_CFG/versions.txt;;
			php) echo "php:" $(php -v) >> $DIR_CFG/versions.txt;;
			psql) echo "psql:" $(psql -V) >> $DIR_CFG/versions.txt;;
			python) echo "python:" $(python -V) >> $DIR_CFG/versions.txt;;
			rsync) echo "rsync:" $(rsync --version|grep version) >> $DIR_CFG/versions.txt;;
			rails) rails --version > $DIR_CFG/versions/$2.txt;;
			ruby) ruby -v > $DIR_CFG/versions/$2.txt;;
			svn) svn help | grep client > $DIR_CFG/versions/$2.txt;;
			wget) echo "wget:" $(wget -V|grep ggdb|grep lib) >> $DIR_CFG/versions.txt;;
			*) virhe VERS "parametria ei tunnistettu!";;
		esac
	fi
}

vers() {
if [ -z "$DIR_CFG" ]; then DIR_CFG=$(asetus dir:cfg); fi
	case $1 in
		-v*) if [ -f $DIR_CFG/versions/$2.txt ]; then cat $DIR_CFG/versions/$2.txt; else virhe VERS "Parametre $2 not recognized!"; fi;;
		-w*)
			case $2 in
			apache) apache2 -v  > $DIR_CFG/versions/$2.txt;;
				curl) curl -V | grep libcurl > $DIR_CFG/versions/$2.txt;;
			git) git --version > $DIR_CFG/versions/$2.txt;;
			heroku) heroku version > $DIR_CFG/versions/$2.txt;;
				gpg) echo "gpg:" $(gpg --version|grep GnuPG) >> $DIR_CFG/versions.txt;;
				imagemagick) identify --version | grep Version > $DIR_CFG/versions/$2.txt;;
				rbenv) rbenv version > $DIR_CFG/versions/$2.txt;;
				*) if [ -f $DIR_CFG/versions.txt ]; then rm $DIR_CFG/versions.txt; fi; echo "versions.txt:" $(pvm) > $DIR_CFG/versions.txt; vers -w gpg; vers_w mysql; vers_w php; vers_w psql; vers_w python; vers_w rsync; vers_w wget;;
			esac;; 
		*)
	if [ -f $DIR_CFG/versions/$1.txt ]; then echo V36 $1 $2
		cat $DIR_CFG/versions/$1.txt
	else
		virhe VERS "Parametria ei tunnistettu!"
	fi;;
	esac
}
