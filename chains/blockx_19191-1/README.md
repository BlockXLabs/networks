<!-- generated file - do not edit -->
# 🔗 `BlockX Chain`

![chain-id](https://img.shields.io/badge/chain%20id-blockx__19191--1-blue?style=for-the-badge)
![stability-stable](https://img.shields.io/badge/stability-stable-green.svg?style=for-the-badge)
![audience](https://img.shields.io/badge/audience-public-white.svg?style=for-the-badge)
![genesis-time](https://img.shields.io/badge/%E2%8F%B0%20genesis%20time-2024--01--16T12%3A00_UTC-blue?style=for-the-badge)



> ℹ️ **The Mainnet is now using Chain ID 19191 🧙‍♂️**. 

## Run a node using the compiled binary file

Feel free to edit the script first according to your own data like the moniker
```sh
chmod +x run_node.sh
./run_node.sh
```

Verify that the node is running
```sh
cd /go/bin
./blockxd status
```

or 

```sh
systemctl status blockxd
```

Make sure that the block height is the same to the current block height which you should see via https://ping.blockxnet.com/blockx

Or you can run the command, if it shows true then it means it is still downloading the blocks to sync to the network. Just wait til it gets to 'true'
```sh
cd go/bin
./blockxd status | jq ".SyncInfo.catching_up"
```

## To be a validator
Make sure first that you have some BCX that you will use as Gas and staked BCX tokens. 

Create a Key first in order for you to have your own wallet in the node using this command below. Feel free to change the key name to something appropriate. This is like an Address Name for your wallet. This will prompt

```sh
cd go/bin
./blockxd keys add ChangeThisKey --keyring-backend file --algo eth_secp256k1
```


Run the script below but change some of the values like Moniker, Key, etc. Moniker is something that everyone would see as your identifier while Key is the one that you created earlier.

```sh
chmod +x run_validator.sh
./run_validator.sh
```


Ping Explorer:
[Mainnet](https://ping.blockxnet.com/blockx), 
[Testnet](https://ping.blockxnet.com/blockx-atlantis-testnet)

EVM Explorer: 
[Mainnet](https://explorer.blockxnet.com/), 
[Testnet](https://testnet-explorer.blockxnet.com/)

Mainnet RPC URL: 
```sh
https://rpc.blockxnet.com
```
Testnet RPC URL: 
```sh
https://atlantis-rpc.blockxnet.com
```

Mainnet API URL: 
```sh
https://api.blockxnet.com
```
Testnet API URL: 
```sh
https://atlantis-api.blockxnet.com
```

Mainnet Web3 RPC: 
```sh
https://web3.blockxnet.com
```
Testnet Web3 RPC: 
```sh
https://atlantis-web3.blockxnet.com
```
