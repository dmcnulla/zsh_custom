#Git
alias gs='git status '
# Add modified
alias gm='gs | grep modified | awk "{print \$2}" '
alias gma='gm | xargs git add '
alias gmr='gm |xargs git reset HEAD '
# Remove deleted
alias gdl='gs | grep deleted | awk "{print \$2}" '
alias gdla='gdl | xargs git rm '
# Add individual
alias ga='git add '
# commit
alias gc='git commit -m '
alias gmc='gma; gc '
# diffs
alias gd='git diff '
alias gdh="git diff HEAD~1 "
# history
alias gh='git hist'
alias ghl='git hist | less'
#stash
alias gstd='git stash drop stash@{0}'
alias gsts='git stash show stash@{0}'
#
alias gco='git checkout '
alias gbo='gco -b '

#functions
function gitignore() { echo "to be used for one file at a time"; echo $1 >> .gitignore; cat .gitignore }
function gitignoreglobal() { echo "to be used for one file at a time"; echo $1 >> ~/.gitignore; cat ~/.gitignore }
