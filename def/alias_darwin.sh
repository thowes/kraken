#!/bin/bash
if [ -f ~/Projects/kraken/lib/bash_aliases.sh ]; then
    . ~/Projects/kraken/lib/bash_aliases.sh
else echo NOT FOUND bash_aliases.sh; fi

alias a='git add -A; git commit -m'
alias asenna='brew install'
alias b=bundle
alias doctor='brew doctor'
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
alias s='synkronoi syn'
alias sammu='sudo shutdown -h now'
alias t=touch
alias tl='ps aux'
alias v=verkko
alias x=exit
alias y='synkronoi ssh'