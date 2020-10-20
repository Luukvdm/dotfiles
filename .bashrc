#
# ~/.bashrc
#

export TERMINAL="alacritty"
export READER="zathura"
export BROWSER="firefox"
export EDITOR="nvim"

# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

for FN in ~/.config/bash/*.sh ; do
    source "$FN"
done

color='\033[38;5;220m\]'
hostnameColor='\033[38;5;214m\]'
if [ $(id -u) -eq 0 ]; then # root
    color='\033[38;5;214m\]'
fi

# When using ssh
#if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        
#else

#fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

