#Git
alias gs='git status '
# Add modified
alias gm='gs | grep modified | awk "{print \$2}" '
alias gma='git_modified_add'

alias gmr='gm |xargs git reset HEAD '


# Remove deleted
alias gdl='gs | grep deleted | awk "{print \$2}" '
alias gdla='gdl | xargs git rm '
# Add individual
alias ga='git_add '
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
alias gco='change_branch '
alias gbo='new_branch '
# Pulls
alias gpo='git pull origin'
alias gpl='git pull origin `git branch | grep ^\* | awk '\''{print $2}'\''`'
alias gpod='git pull origin develop'
alias gpom='git pull origin master'
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

git_add() {
    # Only git add if pdb is not in files we are adding to git, and flake8 passes for them
    set -e
    if [[ ${file: -3} == ".py" ]]; then
        check_for_pdb $*
        run_flake8 $*
    fi
    git add $*
}

git_modified_add() {
    for entry in `git status | grep modified | awk '{print $2}'`
    do
        git_add "$entry"
    done
}

check_for_pdb() {
    if [[ -n `ack-grep pdb $*` ]]; then
        echo 'pdb found'
        exit
    fi
}

run_flake8() {
    python -m flake8 --ignore=E501 --select=C,D,E,F,W $1
}
