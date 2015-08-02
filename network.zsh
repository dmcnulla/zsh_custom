alias inet='ifconfig | grep inet'
alias ip='inet | grep "inet addr" | grep -v "127.0.0.1"'