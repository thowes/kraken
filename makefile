clone:
	git clone https://github.com/thowes/kraken.git

info:
	@git remote show origin

orig:
	@git remote show origin

repo:
	@git remote -v

st:
	@git status

tls:
	@todo.sh ls +krn

upd:
	@git pull
