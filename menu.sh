#!/bin/bash
###################################################################################
# Title: menu.sh
# Description: Bahs-Menu script to manage ssh connections
# Original Author: Haim Cohen 
# https://www.linkedin.com/in/haimc/
# 12-Feb-2020
###################################################################################

echo `clear`
SERVERS=(
    'server-db1'
    'app-server04'
    'ansible-server'
    'k8s-master'
    'mysql-dev-srv02'
    )
echo "SSH-Menu by Haim Cohen 2020"
echo "---------------------------"

echo "Server to connect:"
for server in ${!SERVERS[*]}
do
    printf "%4d: %s\n" $server ${SERVERS[$server]}
done

read -p "Select a server to connect: " CHOISE

read -p "Enter username (default user: ec2-user) : " USERNAME
USERNAME=${USERNAME:-ec2-user}  # If username not set or null, use ec2-user.

PEM=/home/ec2-user/environment/key-pair.pem

read -r -p "Are you using ssh key? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    ssh -i $PEM $USERNAME@${SERVERS[$CHOISE]}
else
    ssh $USERNAME@${SERVERS[$CHOISE]}
fi
