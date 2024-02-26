#!/bin/bash

KEY="node3"
CHAINID="blockx_50-1"
MONIKER="Testnet-RPC"
KEYRING="file" 
KEYALGO="eth_secp256k1"
LOGLEVEL="info"
TOTAL_SUPPLY="1400000000000000000000000000"
MY_TOKENS="350000000000000000000000000abcx"


# validate dependencies are installed
#command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# used to exit on first error (any non-zero exit code)
#set -e

rm -rf ~/.blockxd*

# Reinstall daemon
#make install

#cd /root/go/bin
# Set client config
blockxd config keyring-backend $KEYRING
blockxd config chain-id $CHAINID

# if $KEY exists it should be deleted
blockxd keys add $KEY --keyring-backend $KEYRING --algo $KEYALGO

# Set moniker and chain-id for blockx (Moniker can be anything, chain-id must be an integer)
blockxd init $MONIKER --chain-id $CHAINID

# Change parameter token denominations to abcx
cat $HOME/.blockxd/config/genesis.json | jq '.genesis_time = "2024-02-26T08:00:00.0Z"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["evm"]["params"]["evm_denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["inflation"]["params"]["mint_denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json

# Set gas limit in genesis
cat $HOME/.blockxd/config/genesis.json | jq '.consensus_params["block"]["max_gas"]="10000000"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json

# Allocate genesis accounts (cosmos formatted addresses)
blockxd add-genesis-account $KEY $MY_TOKENS --keyring-backend $KEYRING

total_supply=$TOTAL_SUPPLY
cat $HOME/.blockxd/config/genesis.json | jq -r --arg total_supply "$total_supply" '.app_state["bank"]["supply"][0]["amount"]=$total_supply' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json

# Sign genesis transaction
blockxd gentx $KEY $MY_TOKENS --keyring-backend $KEYRING --chain-id $CHAINID

blockxd collect-gentxs
cd ~/.blockxd/config
jq '.app_state.slashing.params.signed_blocks_window = "40000"' genesis.json > temp.json && mv temp.json genesis.json
jq '.app_state.slashing.params.min_signed_per_window = "0.500000000000000000"' genesis.json > temp.json && mv temp.json genesis.json
jq '.app_state.slashing.params.slash_fraction_double_sign = "0.080000000000000000"' genesis.json > temp.json && mv temp.json genesis.json
jq '.app_state.gov.voting_params.voting_period = "604800s"' genesis.json > temp.json && mv temp.json genesis.json

cd /root/go/bin
blockxd validate-genesis