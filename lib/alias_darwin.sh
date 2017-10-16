#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo ALIAS FILE NOT FOUND; fi

alias a='git add -A; git commit -m'
alias b=bundle
alias g=git
alias h=heroku
alias here='open .'
alias k=kill
alias l='ls -o'
alias n=nano
alias op=open
alias p=projekti_go
alias pa=projekti_avaa
alias r=rails
alias rev='make rev'
alias rt='cd /'
alias sammu='sudo shutdown -h now'
alias t=touch
alias v=verkko
alias x=exit
alias y='synkronoi ssh'