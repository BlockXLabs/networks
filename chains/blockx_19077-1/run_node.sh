#!/bin/bash

MONIKER="MyMoniker"
PROJECT_DIR=$PWD

# Stop & remove old data
sudo systemctl stop blockxd.service
# sudo rm -f /etc/systemd/system/blockxd.service
sudo rm $HOME/go/bin/blockxd
sudo rm -rf $HOME/.blockxd

# Replace service
cp blockxd.service /etc/systemd/system

# Download blockxd
curl -LO https://github.com/BlockXLabs/networks/releases/download/binary/blockxd
chmod +x blockxd

# Create /go/bin if not yet present
mkdir -p /root/go/bin
cp blockxd /root/go/bin

# init binary
cd /root/go/bin
./blockxd config chain-id blockx_19077-1
./blockxd config keyring-backend file
./blockxd init $MONIKER --chain-id blockx_19191-1 --keyring-backend file

cd $PROJECT_DIR
cp genesis.json $HOME/.blockxd/config
cp blockxd.service /etc/systemd/system

export DAEMON_NAME=blockxd         # binary name
export DAEMON_HOME=$HOME/.blockxd  # daemon's home directory

cd $HOME/.blockxd/config

sed -i 's/seeds = \"\"/seeds = \"7abdd111623bfbe97916d21428790f5bf73027c3@146.190.157.123:26656,bae3dceba1a4dd86d219ab3c933647d9c02fcb86@64.23.151.27:26656,c96fa02b65004442f1aea211f0a4256d9341b574@147.182.248.109:26656\"/g' config.toml

systemctl daemon-reload
systemctl start blockxd.service