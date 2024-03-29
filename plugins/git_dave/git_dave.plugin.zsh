#Git
alias gs='git status '
# Add modified
alias gm='gs | grep modified | awk "{print \$2}" '
alias gma='git_modified_add '

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
# branch
alias git_primary='git br | grep ^\* | awk '\''{print $2}'\'''
alias git_current='git branch | grep ^\* | awk '\''{print $2}'\'''
# Pulls
alias gpo='git pull origin'
alias gpl='git pull --rebase origin `git_current`'
alias gpod='git pull origin develop'
alias gpom='git pull origin `git_primary`'
# Push current
alias gps='git push origin `git_current`'
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

# Cleanup local branches
alias gitclean="git branch -a | grep -v ${$(git branch -a | grep remotes | cut -d/'' -f3-)/#/-e} | xargs git branch -D"

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
    if [[ $val == *"TQST-"* ]] || [[ $val == *"QTA-"* ]] || [[ $val == *"TTA-"* ]] || [[ $val == *"TAAS-"* ]]; then
        export_jira $1;
    fi
}

new_branch() {
    val=$1
    git checkout -b $val
    if [[ $val == *"TQST-"* ]] || [[ $val == *"QTA-"* ]] || [[ $val == *"TTA-"* ]] || [[ $val == *"TAAS-"* ]]; then
	    export_jira $val;
    fi
}

export_jira() {
    if [[ $val == *"TQST-"* ]] || [[ $val == *"QTA-"* ]] || [[ $val == *"TTA-"* ]] || [[ $val == *"TAAS-"* ]]; then
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
    for file in $*
    do
        if [[ ${file: -3} == ".py" ]]; then
            run_flake8 $*
        fi;
    done
    git add $*
}

git_modified_add() {
    for entry in `git status | grep modified | awk '{print $2}'`
    do
        git_add "$entry"
    done
}

git_deleted_remove() {
    for entry in `git status | grep deleted | awk '{print $2}'`
    do
        git rm "$entry"
    done
}

check_for_pdb() {
    for file in $*
    do
        if [[ -n `ack-grep pdb $file` ]]; then
            echo 'ERROR: pdb found in' $file
        fi
        if [[ -n `ack-grep pydevd $file` ]]; then
            echo 'ERROR: pydevd found in' $file
        fi
    done
}

run_flake8() {
    if [ ! -f ".flake8" ]; then
        python -m flake8 --config='.flake8' $1
    else
        ack-grep TODO $1
        check_for_pdb $1
        python -m flake8 --max-line-length=120 --exclude=".git,__init__.py,./**/__init__.py,build/*,./**/tests/*.py,./**/integration_tests/*.py" --max-complexity=16 --select=C,D,E,F,W,S $1
    fi
}

export GITHUB_URL=https://github.td.teradata.com/
