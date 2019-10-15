#!/bin/bash
vers() {
if [ -z "$DIR_CFG" ]; then DIR_CFG=$(asetus dir:cfg); fi
case $1 in
	-v*) if [ -f $DIR_CFG/versions.txt ]; then cat $DIR_CFG/versions.txt | grep $2; else virhe VERS "file versions.txt not found!"; fi;;
	-w*)
		case $2 in
			apa*) echo "apache:" $(apache2 -v) >> $DIR_CFG/versions.txt;;
			curl) echo "curl:" $(curl -V | grep libcurl) >> $DIR_CFG/versions.txt;;
			git) echo "git:" $(git --version) >> $DIR_CFG/versions.txt;;
			heroku) echo "heroku:" $(heroku version) >> $DIR_CFG/versions.txt;;
			gpg) echo "gpg:" $(gpg --version|grep GnuPG) >> $DIR_CFG/versions.txt;;
			im*) echo "imagemagick:" $(identify --version|grep Version) >> $DIR_CFG/versions.txt;;
			kraken) echo "kraken:" $(svn info ~/proj/kraken|grep Revision) >> $DIR_CFG/versions.txt;;
			my*) echo "mysql:" $(mysql -V) >> $DIR_CFG/versions.txt;;
			php) echo "php:" $(php -v) >> $DIR_CFG/versions.txt;;
			ps*) echo "psql:" $(psql -V) >> $DIR_CFG/versions.txt;;
			py*) echo "python:" $(python -V|grep Python) >> $DIR_CFG/versions.txt;;
			rails) echo "rails:" $(rails --version) >> $DIR_CFG/versions.txt;;
			rbenv) echo "rbenv:" $(rbenv version) >> $DIR_CFG/versions.txt;;
			rsync) echo "rsync:" $(rsync --version|grep version) >> $DIR_CFG/versions.txt;;
			ruby) echo "ruby:" $(ruby -v) >> $DIR_CFG/versions.txt;;
			svn) echo "svn:" $(svn help|grep client) >> $DIR_CFG/versions.txt;;
			wget) echo "wget:" $(wget -V|grep Wget) >> $DIR_CFG/versions.txt;;
			*)
				if [ -f $DIR_CFG/versions.txt ]; then rm $DIR_CFG/versions.txt; fi
				echo "versions.txt:" $(pvm) > $DIR_CFG/versions.txt
				vers -w curl; vers -w git; vers -w gpg; vers -w heroku; vers -w im; vers -w my; vers -w py; vers -w rails; vers -w rbenv; vers -w rsync; vers -w ruby; vers -w wget
				#vers -w apache; vers -w php; vers -w psql; vers -w svn;
				;;
		esac;; 
	*)
		if [ -z "$1" ]; then
			vers -w all
		else
			if [ -f $DIR_CFG/versions.txt ]; then cat $DIR_CFG/versions.txt | grep "$1"; else virhe "VERS versions.txt not found!"; fi
		fi;;
esac
}
