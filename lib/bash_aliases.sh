alias ..='cd ..'
alias add='git add -A; git commit -m'
alias branch='git branch'
alias bu=bundle
alias bx='bundle exec'
alias cd..='cd ..'
alias cd2='cd ..;cd ..'
alias cd3='cd ..;cd ..;cd ..'
alias cim='svn commit -m'
alias co='git co'
alias ed=muokkaa
alias gm='git add .; git commit -m'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias hst='cat ~/.bash_history'
alias k80=kaiku80
alias k9='kill -9'
alias levy='df -h'
alias l='ls -la'
alias ll='ls -la|less'
alias m=less
alias merge='git merge'
alias migrate='rake db:migrate'
alias mk=make
alias more=less
alias n2='nano -w -T 2'
alias proj=projekti
alias psf='ps fu'
alias pull='git pull'
alias push='git push'
alias remote='git remote'
alias reset='rake db:migrate:reset'
alias rk=rake
alias rollback='rake db:rollback'
alias routes='rake routes'
alias rs=rspec
alias ru=screen
alias seed='rake db:seed RAILS_ENV=development'
alias server='rails server -p $PORT -b $IP'
alias st='if [ -f makefile ]; then make st; else git st; fi'
alias test='rake test'
alias up='make upd'
alias upd='make upd'
alias update='make upd'

if [ -f ~/proj/config/$HOSTNAME/alias.sh ]; then
    . ~/proj/config/$HOSTNAME/alias.sh
fi
