<!-- generated file - do not edit -->
# 🔗 `blockx_190-1`

![chain-id](https://img.shields.io/badge/chain%20id-blockx__190--1-blue?style=for-the-badge)
![stability-stable](https://img.shields.io/badge/stability-stable-green.svg?style=for-the-badge)
![audience](https://img.shields.io/badge/audience-public-white.svg?style=for-the-badge)
![genesis-time](https://img.shields.io/badge/%E2%8F%B0%20genesis%20time-2024--02--27T12%3A00_UTC-blue?style=for-the-badge)

# Pre-requisites:
Go version 1.18

Ubuntu 22.04

# Pre-requisite step
## 1) Install Golang:
Install latest go version https://golang.org/doc/install

```
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
source ~/.profile
```

To verify that Golang installed
```
go version
```

It should return go version go1.18 linux/amd64 or later

# How to run a fullnode using Ubuntu 22.04
```
git clone https://github.com/BlockXLabs/networks.git
cd chains/blockx_190-1
./run-fullnode.sh
```

# How to add blockxd path for it to be accessible system-wide
In the example below, blockxd is in /root/go/bin
```
export PATH=/root/go/bin:$PATH
source ~/.bashrc
```


# How to add a key 
```
blockxd keys add <your key name> --keyring-backend file --algo eth_secp256k1
# e.g.  blockxd keys add mykey --keyring-backend file --algo eth_secp256k1
```
It will prompt you to create a keyring passphrase, make sure you remember it as you're going to need this for every transactions. After entering the passphrase, it will give you your address together with a recovery phrase, make sure to have a copy of it. You can use this passphrase to import your key/wallet to another wallet like Metamask.


# How to become a validator using Ubuntu 22.04
Make sure to request for some BCX tokens first from the BCX Team or you can get some from [here](https://ping.blockxnet.com/blockx-atlantis-testnet/faucet)
```
Once you already have a node running run the ./run-validator.sh file in this folder

Ping Explorer:
[Mainnet](https://ping.blockxnet.com/blockx), 
[Testnet](https://ping.blockxnet.com/blockx-atlantis-testnet)

EVM Explorer: 
Coming soon

Testnet RPC URL: 
[https://atlantis-rpc.blockxnet.com](https://atlantis-rpc.blockxnet.com)

API URL:
[https://atlantis-api.blockxnet.com](https://atlantis-api.blockxnet.com)

Web3 RPC
[https://atlantis-web3.blockxnet.com](https://atlantis-web3.blockxnet.com)
