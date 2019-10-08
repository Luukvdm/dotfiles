#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
LGREEN='\033[0;37m'
NC='\033[0m'

PROCCOUNT=`ps -Afl | wc -l`
PROCCOUNT=`expr $PROCCOUNT - 5`
GROUPZ=`groups`
USER=`whoami`
DIR=`dirname "$0"`

HOSTNAME=`hostname`
KERNEL=`uname -r`
DISTRO=`cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g'`
UPTIME=`uptime | sed 's/.*up ([^,]*), .*/1/'`
TIME=`date`
CPU=`cat /proc/cpuinfo | grep "model name" | cut -d ' ' -f3- | awk {'print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10'} | head -1`
MEMORY="`free -t -m | grep "Mem" | awk {'print $4'}`MB Available, `free -t -m | grep "Mem" | awk {'print $3'}`MB Used, `free -t -m | grep "Mem" | awk {'print $2'}`MB Total"

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
${BLUE}+++++++++++++++++: \033[0;37mSystem Data${BLUE} :+++++++++++++++++++
${BLUE}+       \033[0;37mHostname ${BLUE}= \033[1;32m${HOSTNAME}
${BLUE}+         \033[0;37mKernel ${BLUE}= \033[1;32m${KERNEL}
${BLUE}+         \033[0;37mDistro ${BLUE}= \033[1;32m${DISTRO}
${BLUE}+         \033[0;37mUptime ${BLUE}= \033[1;32m${UPTIME}
${BLUE}+           \033[0;37mTime ${BLUE}= \033[1;32m${TIME}
${BLUE}+            \033[0;37mCPU ${BLUE}= \033[1;32m${CPU}
${BLUE}+         \033[0;37mMemory ${BLUE}= \033[1;32m${MEMORY}
${BLUE}++++++++++++++++++: \033[0;37mUser Data${BLUE} :++++++++++++++++++++
${BLUE}+      \033[0;37m Username ${BLUE}= \033[1;32m${USER}
${BLUE}+      \033[0;37mUsergroup ${BLUE}= \033[1;32m${USERGROUP}
${BLUE}+     \033[0;37mLast Login ${BLUE}= \033[1;32m${LASTLOGIN}
${BLUE}+       \033[0;37mSessions ${BLUE}= \033[1;32m${SESSIONS}
${BLUE}+      \033[0;37mProcesses ${BLUE}= \033[1;32m${PROCESSES}
${BLUE}+++++++++++++++++++++++++++++++++++++++++++++++++++++
\033[0;37m
"
