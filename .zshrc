export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/zsh_custom
plugins=(git ackgrep directory docker pipe autojump vagrant python media)

source $ZSH/oh-my-zsh.sh


ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

export VBOX_INSTALL_PATH=/usr/lib/virtualbox

export PATH=$PATH:$VBOX_INSTALL_PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
