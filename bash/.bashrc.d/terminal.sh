
if [ $(id -u) -eq 0 ];
then # root
  PS1='\033[0;31m \w\[$(tput sgr0)\] \033[0m'
else # normal
  PS1='\033[1;34m \w\[$(tput sgr0)\] \033[0m'
fi

# Tilix vte thing that doesnt work
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
