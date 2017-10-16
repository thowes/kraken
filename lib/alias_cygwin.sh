#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo ALIAS FILE NOT FOUND; fi

alias a='git add -A; git commit -m'
alias b=bundle
alias cdr='cd /cygdrive; cd'
#alias d2u=dos2unix
alias edr=muokkaa_drives
alias g=git
alias h=heroku
alias here='open .'
alias ipf=ipconfig
alias k=kill
alias l='ls -o'
alias md5=md5sum
alias n=nano
alias np=notepad
alias op=cygstart
alias open=cygstart
alias p=projekti_go
alias pa=projekti_avaa
alias r=rails
alias rev='make rev'
alias rt='cd /'
alias t=touch
alias tl=tasklist
alias v=verkko
alias x=exit
alias y='synkronoi ssh'