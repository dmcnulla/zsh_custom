export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/zsh_custom
plugins=(git ackgrep directory docker pipe)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
