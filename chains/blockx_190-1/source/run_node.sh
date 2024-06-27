#!/bin/bash

MONIKER="MyNode"
PROJECT_DIR=$PWD

# Stop & remove old data
sudo systemctl stop blockxd.service
# sudo rm -f /etc/systemd/system/blockxd.service
# sudo rm $HOME/go/bin/blockxd
sudo rm -rf $HOME/.blockxd

# Replace service
cp blockxd.service /etc/systemd/system

# copy blockxd from /root/go/bin
cp /root/go/bin/blockxd blockxd

# init binary
./blockxd config chain-id blockx_100-1
./blockxd config keyring-backend file
./blockxd init $MONIKER --chain-id blockx_100-1 --keyring-backend file

cd $PROJECT_DIR
cp genesis.json $HOME/.blockxd/config
cp blockxd.service /etc/systemd/system

export DAEMON_NAME=blockxd         # binary name
export DAEMON_HOME=$HOME/.blockxd  # daemon's home directory

cd $HOME/.blockxd/config

sed -i 's/seeds = \"\"/seeds = \"479dfa1948f49b08810cd16bf6c2d3256ae85423@137.184.7.64:26656,e15f4d31281036c69fa17269d9b26ff8733511c6@147.182.238.235:26656,9b84b33d44a880a520006ae9f75ef030b259cbaf@137.184.38.212:26656,85d0069266e78896f9d9e17915cdfd271ba91dfd@146.190.153.165:26656\"/g' config.toml

systemctl daemon-reload
systemctl start blockxd.service