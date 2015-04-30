clone:
	git clone https://github.com/thowes/kraken.git

info:
	@git remote show origin

install:
	. ./install.sh

orig:
	@git remote -v| grep origin

repo:
	@git remote -v

st:
	@git status

tls:
	@todo.sh ls +krn

upd:
	@git pull
