<!-- generated file - do not edit -->
# 🔗 `BlockX Chain`

![chain-id](https://img.shields.io/badge/chain%20id-blockx__100--1-blue?style=for-the-badge)
![stability-stable](https://img.shields.io/badge/stability-stable-green.svg?style=for-the-badge)
![audience](https://img.shields.io/badge/audience-public-white.svg?style=for-the-badge)
![genesis-time](https://img.shields.io/badge/%E2%8F%B0%20genesis%20time-2024--01--16T12%3A00_UTC-blue?style=for-the-badge)



> ℹ️ **The Mainnet is now using Chain ID 190 🧙‍♂️**. 

## Install the Prerequisites 

Make sure that you're running at least Ubuntu 22
Install Go

```sh
get -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
source ~/.profile
```

Install Make to compile the code

```sh
sudo apt install make
```

Install GCC in case GCC is not yet installed

```sh
sudo apt-get install gcc
```

## Run the scripts
Get the source code
```sh
git clone https://github.com/BlockXLabs/networks
git cd chains/blockx_190-1/source
```

Compile blockxd
```sh
git clone https://github.com/BlockXLabs/networks
git cd chains/blockx_190-1/source
```

Run a node. Feel free to edit the script first according to your own data like the moniker
```sh
chmod +x run_node.sh
./run_node.sh
```

Verify that the node is running
```sh
./blockxd status
```

To be a validator, run the script below but change some of the values like Moniker, Key, etc
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
