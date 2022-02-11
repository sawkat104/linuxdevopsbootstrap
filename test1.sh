#!/bin/sh


# Creates directory & download ADO agent install files
cd /home/azureuser/
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/2.186.1/vsts-agent-linux-x64-2.186.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.186.1.tar.gz
 
# Unattended install
./config.sh --unattended \
  --agent "$(hostname)" \
  --url $1 \
  --auth $2 \
  --token "lukspdn2imzgatakygjlix4ecypl76z67gytwzf4hd3ush6i24wq" \
  --pool "testing" \
  --replace \
  --acceptTeeEula & wait $!
 
cd /home/azureuser/
#Configure as a service
sudo ./svc.sh install azureuser
 
#Start svc
sudo ./svc.sh start