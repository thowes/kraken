add:
	git add .

clone:
	git clone https://github.com/thowes/kraken.git

commit:
	git commit

info:
	@git remote show origin

orig:
	@git remote show origin

pull:
	git pull

push:
	git push

repo:
	@git remote -v

st:
	@git status

tls:
	@todo.sh ls +krn

upd:
	git pull
