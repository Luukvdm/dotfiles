color='\033[38;5;33m\]'
hostnameColor='\033[38;5;214m\]'
if [ $(id -u) -eq 0 ]; then # root
	color='\033[38;5;196m\]'
fi
# \[\033[38;5;15m\] 
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	PS1=" \[$(tput sgr0)\]\[$hostnameColor\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
	PS1=" \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

# Tilix vte thing that doesnt work
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
