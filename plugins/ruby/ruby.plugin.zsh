# #RVM & Ruby
alias rvm_login='/bin/zsh --login'
alias rl='rvm_login'
alias rvm_use='rvm gemset use '
alias ru='rvm_use '
alias rvm_cur='rvm current'
alias rvm_list='rvm gemset list'
alias gg='gem list|grep '
# alias pups='rvm use 1.9.3 && rvm gemset use puppies'
# alias eco='rvm use jruby && rvm gemset use puppies'
# alias pm='ps aux | grep -v grep | grep '
alias bu='bundle update'

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

#yard
alias yd='yardoc features/**/*.feature features/**/*.rb lib/**/*.rb'

export RESULTS='/home/dave/dev/results'

rb() {
  rm ~/.irb-history
  irb
}