#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
LGREEN='\033[0;37m'
LGRAY='\033[0;37m'
ORANGE='\033[0;33m'
NC='\033[0m'

BOLD='\033[1m'
NORMAL='\033[0m'
BLINKING='\033[5m'
REVERSE='\033[7m'

echo -e "${RED} ${BOLD}"
echo "$HOSTNAME" | sed 's/[^-]\+/\L\u&/g' | figlet -c -f slant.flf
echo -e "${NORMAL} ${NC}"

# echo -e "${RED} _                 _    _            _           _    _              "
# echo -e "| |               | |  ( )          | |         | |  | |             "
# echo -e "| |    _   _ _   _| | _|/ ___     __| | ___  ___| | _| |_ ___  _ __  "
# echo -e "| |   | | | | | | | |/ / / __|   / _\` |/ _ \/ __| |/ / __/ _ \\| '_ \\ "
# echo -e "| |___| |_| | |_| |   <  \__ \  | (_| |  __/\__ \   <| || (_) | |_) |"
# echo -e "\\_____/\\__,_|\\__,_|_|\\_\\ |___/   \__,_|\___||___/_|\_\\\__\___/| .__/ "
# echo -e "                                                              | |    "
# echo -e "                                                              |_|    ${NC}"



PROCCOUNT=`ps -Afl | wc -l`
PROCCOUNT=`expr $PROCCOUNT - 5`
GROUPZ=`groups`
USER=`whoami`

# HOSTNAME=`$HOSTNAME`
KERNEL=`uname -r`
DISTRO=`cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g'`
UPTIME=`uptime | sed 's/.*up ([^,]*), .*/1/'`
TIME=`date`
CPU=`cat /proc/cpuinfo | grep "model name" | cut -d ' ' -f3- | awk {'print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10'} | head -1`
MEMORY="`free -t -m | grep "Mem" | awk {'print $4'}` MB Available, `free -t -m | grep "Mem" | awk {'print $3'}` MB Used, `free -t -m | grep "Mem" | awk {'print $2'}` MB Total"

LASTLOGIN="`last -a luuk | head -2 | awk 'NR==2{print $3,$4,$5,$6}'` from `last -a luuk | head -2 | awk 'NR==2{print $10}'`"
SESSIONS=`who | grep $USER | wc -l`
PROCESSES="$PROCCOUNT of `ulimit -u` max"

if [[ $GROUPZ == "$USER sudo" ]]; then
USERGROUP="Administrator"
elif [[ $USER = "root" ]]; then
USERGROUP="Root"
elif [[ $USER = "$USER" ]]; then
USERGROUP="Regular User"
else
USERGROUP="$GROUPZ"
fi

echo -e "
${BLUE}+++++++++++++++++: ${LGRAY}System Data${BLUE} :+++++++++++++++++++
${BLUE}+       ${LGRAY}Hostname ${BLUE}= ${ORANGE}${HOSTNAME}
${BLUE}+         ${LGRAY}Kernel ${BLUE}= ${ORANGE}${KERNEL}
${BLUE}+         ${LGRAY}Distro ${BLUE}= ${ORANGE}${DISTRO}
${BLUE}+         ${LGRAY}Uptime ${BLUE}=${ORANGE}${UPTIME}
${BLUE}+           ${LGRAY}Time ${BLUE}= ${ORANGE}${TIME}
${BLUE}+            ${LGRAY}CPU ${BLUE}= ${ORANGE}${CPU}
${BLUE}+         ${LGRAY}Memory ${BLUE}= ${ORANGE}${MEMORY}
${BLUE}++++++++++++++++++: \033[0;37mUser Data${BLUE} :+++++++++++++++++++++
${BLUE}+       ${LGRAY}Username ${BLUE}= ${ORANGE}${USER}
${BLUE}+      ${LGRAY}Usergroup ${BLUE}= ${ORANGE}${USERGROUP}
${BLUE}+     ${LGRAY}Last Login ${BLUE}= ${ORANGE}${LASTLOGIN}
${BLUE}+       ${LGRAY}Sessions ${BLUE}= ${ORANGE}${SESSIONS}
${BLUE}+      ${LGRAY}Processes ${BLUE}= ${ORANGE}${PROCESSES}
${BLUE}+++++++++++++++++++++++++++++++++++++++++++++++++++++
\033[0;37m
"
