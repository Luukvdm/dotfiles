#!/bin/bash

# Check if rsync is installed
if ! type rsync &> /dev/null; then
    echo "Rsync is not installed!"
    exit 127
fi

remoteuser=user
remotehost=example.com
localhost=example.lan
remotefolder=/home/$remoteuser/backups/active
 
if ping -c1 -w3 $localhost > /dev/null 2>&1
then
    host=$localhost
else
    if ping -c1 -w3 $remotehost > /dev/null 2>&1
    then
	host=$remotehost
    else
	echo "Ping did not respond; Can't sync files!" >&2
	exit 1
    fi
fi

echo "Using hostname: " $host

function backup_folder {
    localfolder=$1
    echo "Backing up folder " $localfolder

    rsync -a --delete --quiet -e ssh $localfolder $host:$remotefolder
    echo "Finished synching folder"
}

backup_folder /home/user/code
backup_folder /home/user/documents




