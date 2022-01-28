upload_package() {
    APP_VERSION=$1 ARTIFACTORY_USER=ua230042 ARTIFACTORY_PASSWORD=AP3QAeptPVMk5ouw7BwKgXE5UKE python3 setup.py sdist bdist_wheel upload -r local
}

alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
alias RF='rm -rf '

alias e='chmod +x '

# jupyter lab
alias jup='cd ~/projects/jupyter_jobs && jupyter lab'

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

alias venv='venv_source '
alias vnvd='deactivate'

alias f8="python -m flake8 --ignore=E501 --select=C,D,E,F,W '--exclude=.svn,CVS,.bzr,.hg,.git,__pycache__,.tox,.eggs,*.egg,venv,.virtualenvs' ."

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Virtual Environments for Python
ve() {
    # sets the current project name to virtual env (must be named the exact same)
    current_project=${PWD##*/}
	  source ~/.virtualenvs/$current_project/bin/activate
}

webrick() {
    ruby -rwebrick -e "WEBrick::HTTPServer.new(:Port => $1, :DocumentRoot => Dir.pwd).start"
}

alias tds='tdldapsearch '

tdldapsearch() {
  email=$1
  verbose=$2
  if [[ "${verbose}" == 'verbose' ]]; then
    ldapsearch -H "ldaps://ldaps.td.teradata.com" -D "CN=ja230103,OU=Application Accounts,DC=TD,DC=TERADATA,DC=COM" -b "DC=TD,DC=TERADATA,DC=COM" -w 'Redmagnolia#21' "mail=$email"
  else
    ldapsearch -H "ldaps://ldaps.td.teradata.com" -D "CN=ja230103,OU=Application Accounts,DC=TD,DC=TERADATA,DC=COM" -b "DC=TD,DC=TERADATA,DC=COM" -w 'Redmagnolia#21' "userPrincipalName=$email" | grep 'cn'
  fi
}

alias rtds='reverse_tdldapsearch '
reverse_tdldapsearch() {
  qlid=$1
  ldapsearch -H "ldaps://ldaps.td.teradata.com" -D "CN=ja230103,OU=Application Accounts,DC=TD,DC=TERADATA,DC=COM" -b "DC=TD,DC=TERADATA,DC=COM" -w 'Redmagnolia#21' "cn=$qlid"
}

alias dtds='dname_tdldapsearch '
dname_tdldapsearch() {
  dname=$1
  ldapsearch -H "ldaps://ldaps.td.teradata.com" -D "CN=ja230103,OU=Application Accounts,DC=TD,DC=TERADATA,DC=COM" -b "DC=TD,DC=TERADATA,DC=COM" -w 'Redmagnolia#21' "displayName=$dname"
}

rename_file_ext() {
  for file in *.$1
  do
    mv "$file" "${file%.$1}.$2"
  done
}

venv_source() {
  source ~/.virtualenvs/$1/bin/activate
}

# kubectl
alias set_kube_config_azure="set_kube_config azureConfig2Light"
alias set_kube_config_onprem="set_kube_config config"
alias set_name_space_default="set_namespace default"
alias set_name_space_jenkins="set_namespace jenkins"
