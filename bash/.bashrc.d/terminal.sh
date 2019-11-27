color='[38;5;4m\]'
if [ $(id -u) -eq 0 ]; then # root
	color='[0;31m\]'
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	PS1="\h \[$(tput bold)\]\[$(tput sgr0)\]\[\033$color~\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
	PS1=" \[$(tput bold)\]\[$(tput sgr0)\]\[\033$color~\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

# Tilix vte thing that doesnt work
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
