alias inet='ifconfig | grep inet'
alias ip='inet | grep "inet addr" | grep -v "127.0.0.1"'


print_user() {
	ldapsearch -x -LLL -D "TD\dm186069" -W -b "DC=TD,DC=TERADATA,DC=COM" -H ldaps://ldaps.td.teradata.com samaccountname="$1"
}
