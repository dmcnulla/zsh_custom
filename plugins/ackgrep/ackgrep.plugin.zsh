#Find
alias a='ack-grep '
alias ag='which '
agg() { ack-grep -H $* $ZSH_CUSTOM }

alias f='find . |grep -v svn |grep '
alias findjar='find . -type f -name  *.jar |xargs -n1 -i -t  jar tvf {} |grep '

alias h='history'
alias hg='history|grep -v grep|grep '
alias hgg='history|grep '

alias pg='ps -eaf|grep -v grep|grep -i ' 
alias pgg='ps -eaf|grep '

alias lg='lla|grep '

process_by_port() {
  sudo netstat -anp|grep "\W$1\W"
}

pport() {
    for i in "`get_process_id $1`"
    do
        netstat -anp | grep "$i"
    done
}


get_process_id() {
    name=$1
    ps -ef | grep -v grep | grep $name | awk '{ print $2 }'
}
