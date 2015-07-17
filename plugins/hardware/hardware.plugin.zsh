getID() {
	xinput list|grep "Synaptics TouchPad"|awk '{print $6 }'|cut -d'=' -f2
}

alias laptopprimary='xrandr --output LVDS --primary'

alias tpf='xinput set-prop `getID` "Device Enabled" 0'
alias tpn='xinput set-prop `getID` "Device Enabled" 1'

