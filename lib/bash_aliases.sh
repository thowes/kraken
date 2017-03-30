alias ..='cd ..'
alias ...='cd ..;cd ..'
alias ....='cd ..;cd ..;cd ..'
alias add='git add -A; git commit -m'
alias bi='bundle install'
alias biw='bundle install --without'
alias branch='git branch'
alias bu=bundle
alias bx='bundle exec'
alias cd..='cd ..'
alias cim='svn commit -m'
alias clone='git clone'
alias co='git checkout'
alias ed=muokkaa
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias grep='grep --color'                     # show differences in colour
alias hst='cat ~/.bash_history'
alias k80=kaiku80
alias k9='kill -9'
alias levy='df -h'
alias merge='git merge'
alias migrate='rails db:migrate'
alias migrate='rails db:migrate'
alias mk=make
alias more=less
alias n2='nano -w -T 2'
alias origin='git remote -v|grep origin'
alias proj=projekti
alias psf='ps fu'
alias pull='git pull'
alias push='git push'
alias remote='git remote'
alias reset='rake db:migrate:reset'
#alias rk=rake
alias rollback='rails db:rollback'
alias routes='rake routes'
alias rs=rspec
alias ru=screen
alias seed='rake db:seed RAILS_ENV=development'
alias srv='rails server -b $IP -p $PORT'
alias st='if [ -f makefile ]; then make st; else git status; fi'
alias syn=synkronoi
alias synk=synkronoi
alias tst='rails test'
alias upd=projekti_update

if [ -f ~/Projects/config/$HOSTNAME/alias.sh ]; then
    . ~/Projects/config/$HOSTNAME/alias.sh
else echo HOSTNAME ALIAS NOT FOUND
fi