#!/bin/bash
vers_w() {
	if [ -d $DIR_CFG/versions/ ]; then
		case $1 in
			kraken) svn info ~/proj/kraken|grep Revision > $KR_DIR_CFG/versions/$1.txt;;
			*) virhe VERS "parametria ei tunnistettu!";;
		esac
	fi
}

vers() {
if [ -z "$DIR_CFG" ]; then DIR_CFG=$(asetus dir:cfg); fi
case $1 in
	-v*) if [ -f $DIR_CFG/versions.txt ]; then cat $DIR_CFG/versions.txt | grep $2; else virhe VERS "file versions.txt not found!"; fi;;
	-w*)
		case $2 in
			apache) echo "apache:" $(apache2 -v) >> $DIR_CFG/versions.txt;;
			curl) echo "curl:" $(curl -V | grep libcurl) >> $DIR_CFG/versions.txt;;
			git) echo "git:" $(git --version) >> $DIR_CFG/versions.txt;;
			heroku) echo "heroku:" $(heroku version) >> $DIR_CFG/versions.txt;;
			gpg) echo "gpg:" $(gpg --version|grep GnuPG) >> $DIR_CFG/versions.txt;;
			imagemagick) echo "imagemagick:" $(identify --version|grep Version) >> $DIR_CFG/versions.txt;;
			mysql) echo "mysql:" $(mysql -V) >> $DIR_CFG/versions.txt;;
			php) echo "php:" $(php -v) >> $DIR_CFG/versions.txt;;
			psql) echo "psql:" $(psql -V) >> $DIR_CFG/versions.txt;;
			python) echo "python:" $(python -V|grep Python) >> $DIR_CFG/versions.txt;;
			rails) echo "rails:" $(rails --version) >> $DIR_CFG/versions.txt;;
			rbenv) echo "rbenv:" $(rbenv version) >> $DIR_CFG/versions.txt;;
			rsync) echo "rsync:" $(rsync --version|grep version) >> $DIR_CFG/versions.txt;;
			ruby) echo "ruby:" $(ruby -v) >> $DIR_CFG/versions.txt;;
			svn) echo "svn:" $(svn help|grep client) >> $DIR_CFG/versions.txt;;
			wget) echo "wget:" $(wget -V|grep Wget) >> $DIR_CFG/versions.txt;;
			*) if [ -f $DIR_CFG/versions.txt ]; then rm $DIR_CFG/versions.txt; fi; echo "versions.txt:" $(pvm) > $DIR_CFG/versions.txt; vers -w apache; vers -w curl; vers -w git; vers -w gpg; vers -w heroku; vers -w imagemagick; vers -w mysql; vers -w php; vers -w psql; vers -w python; vers -w rails; vers -w rbenv; vers -w rsync; vers -w ruby; vers -w svn; vers -w wget;;
		esac;; 
	*)
	if [ -f $DIR_CFG/versions.txt ]; then
		cat $DIR_CFG/versions.txt | grep "$1"
	else
		virhe "VERS versions.txt not found!"
	fi;;
esac
}
