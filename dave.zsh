alias e='chmod +x '

#sublime
alias s='subl '

#tar
alias tj='tar -xvjpf'
alias t='tar xvfz '
alias tz='tar -xvzpf'

#sudo stuff
alias sapt='sudo apt-get '
alias supd='sudo apt-get update '
alias sup='sudo apt-get upgrade '
alias sin='sudo apt-get install '
alias srem='sudo apt-get remove '
alias repos='sudo add-apt-repository '
alias _='sudo '

alias vnva='source ~/venv/bin/activate'
alias vnvd='deactivate'

# Virtual Environments for Python
use_ve() {
	source ~/virtual_env/$1/bin/activate
}

create_ve() {
	cd ~/virtual_env
	virtualenv $1
	popd
}

webrick() {
    ruby -rwebrick -e "WEBrick::HTTPServer.new(:Port => $1, :DocumentRoot => Dir.pwd).start"
}
