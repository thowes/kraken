#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo NOT FOUND bash_aliases.sh; fi

alias 256=sha256sum
alias 512=sha512sum
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
alias l='ls -oA'
alias md5=md5sum
alias n=nano
alias np=notepad
alias op=cygstart
alias open=cygstart
alias p=projekti
#alias pa=projekti_avaa
alias r=rails
alias rt='cd /'
alias s='synkronoi syn'
alias sha1=sha1sum
alias t=touch
alias tl=tasklist
alias u='synkronoi upl'
alias v=verkko
alias x=exit
alias y='synkronoi ssh'