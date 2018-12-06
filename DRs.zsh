# Usage
# chrome http://some.web.page.com
# open_dr <dr_number>
# open_dr_list <dr_number>,<dr_number>,<dr_number>

export darts_url="https://darts.td.teradata.com:7443/tools/darts/ShowPC.cfm?x=77&y=8&change_app_code=DR&Change_Number="

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

open_dr() {
    chrome "${darts_url}${1}&expanded=Y#Comments"
}

open_dr_list() {
    for i in $(echo $1 | tr "," " ");
    do
        open_dr $i;
    done
}
