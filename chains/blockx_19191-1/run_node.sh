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
curl -LO https://github.com/defi-ventures/BCX-atlantis-testnet-2-node-compiled/releases/download/assets/blockxd
chmod +x blockxd

# Create /go/bin if not yet present
mkdir -p /root/go/bin
cp blockxd /root/go/bin

# init binary
cd /root/go/bin
./blockxd config chain-id blockx_19191-1
./blockxd config keyring-backend file
./blockxd init $MONIKER --chain-id blockx_19191-1 --keyring-backend file

cd $PROJECT_DIR
cp genesis.json $HOME/.blockxd/config
cp blockxd.service /etc/systemd/system

export DAEMON_NAME=blockxd         # binary name
export DAEMON_HOME=$HOME/.blockxd  # daemon's home directory

cd $HOME/.blockxd/config

sed -i 's/seeds = \"\"/seeds = \"f283e46301321e574a298fba910344b90a58beca@52.165.82.233:26656\"/g' config.toml

systemctl daemon-reload
systemctl start blockxd.service