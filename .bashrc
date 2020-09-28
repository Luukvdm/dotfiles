# Default programs
export READER="zathura"
export TERMINAL="tilix"
export BROWSER="firefox"
export READER="zathura"

# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

for FN in $HOME/.bashrc.d/*.sh ; do
    source "$FN"
done

# Terminal settings
color='\033[38;5;220m\]'
hostnameColor='\033[38;5;214m\]'
if [ $(id -u) -eq 0 ]; then # root
    color='\033[38;5;196m\]'
fi

# When using ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1=" \[$(tput sgr0)\]\[$hostnameColor\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
    PS1=" \[$(tput bold)\]\[$(tput sgr0)\]\[$color\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

# Tilix vte thing that doesnt work
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

