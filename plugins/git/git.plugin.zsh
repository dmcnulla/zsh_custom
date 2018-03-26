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
alias gc='git_commit '
alias gmc='gma; gc '
# Remove deleted
alias gdl='gs | grep deleted | awk "{print \$2}" '
alias gdla='gdl | xargs git rm '
# diffs
alias gd='git diff '
alias gdh="git diff HEAD~1 "
# history
alias gh='git hist'
alias ghl='git hist | less'
#stash
alias gstd='git stash drop stash@{0}'
alias gsts='git stash show stash@{0}'
alias go='change_branch '
alias gbo='new_branch '
# Pulls
alias gpo='git pull origin'
alias gpl='git pull origin `git branch | grep ^\* | awk '\''{print $2}'\''`'
alias gpod='git pull origin develop'
# Push current
alias gps='git push origin `git branch | grep ^\* | awk '\''{print $2}'\''`'
# git ignore
alias gi='gitignore '
alias gig='gitignoreglobal '

# git stash
alias gsl='git stash list'
alias gsa='git stash apply'
alias gss='git stash save'

# git reset
alias gr='git reset '
alias gr1='git reset HEAD^'
alias gr2='git reset HEAD^^'
alias grh='git reset --hard'
alias grh1='git reset HEAD^ --hard'
alias grh2='git reset HEAD^^ --hard'

#functions
function gitignore() { echo "to be used for one file at a time"; echo $1 >> .gitignore; cat .gitignore }
function gitignoreglobal() { echo "to be used for one file at a time"; echo $1 >> ~/.gitignore; cat ~/.gitignore }

export JIRA_CARD=''

ask_jira_card() {
    val=''
    echo "Enter the Jira Card Number [${JIRA_CARD}]:"
    read val
    case $val in (*[![:blank:]]*)
        export_jira $val;;
	esac
}

change_branch() {
    val=$1
    git checkout $1
    if [[ $val == *"TQST-"* ]]; then
        export_jira $1;
    fi
}

new_branch() {
    val=$1
    git checkout -b $val
    if [[ $val == *"TQST-"* ]]; then
	    export_jira $val;
    fi
}

export_jira() {
    if [[ $val == *"TQST-"* ]]; then
        export JIRA_CARD=$1
    else
        export JIRA_CARD=""
    fi
    echo "Using ${JIRA_CARD} as JIRA_CARD variable"
}

git_commit() {
	ask_jira_card
	git commit -m "${JIRA_CARD} $1"
}
