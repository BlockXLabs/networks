<!-- generated file - do not edit -->
# 🔗 `BlockX Chain`

![chain-id](https://img.shields.io/badge/chain%20id-blockx__100--1-blue?style=for-the-badge)
![stability-stable](https://img.shields.io/badge/stability-stable-green.svg?style=for-the-badge)
![audience](https://img.shields.io/badge/audience-public-white.svg?style=for-the-badge)
![genesis-time](https://img.shields.io/badge/%E2%8F%B0%20genesis%20time-2024--01--16T12%3A00_UTC-blue?style=for-the-badge)

## Register in the Genesis

> ℹ️ **Registration has ended last January 5, 2024 🧙‍♂️**. 

Interested Validators had to submit their gentx 

```sh
# Init node
blockxd init your-moniker --chain-id blockx_100-1

# Create keys, make sure that you store the generated mnemonics somewhere safe.
blockxd keys add your-key-name

# Set account necessary balance
blockxd add-genesis-account your-key-name 10000000000000000000000abcx
```

You can also edit the other values such as commission rate, website, contact and others.

```sh
# Create the gentx
blockxd gentx your-key-name 10000000000000000000000abcx \
  --node-id $(blockxd tendermint show-node-id) \
  --chain-id blockx_100-1 \
  --commission-rate 0.05 \
  --commission-max-rate 0.10 \
  --commission-max-change-rate 0.01 \
  --min-self-delegation 10000 \
  --website "https://blockxnet.com" \
  --details "My 1st Validator" \
  --identity "ABCDE12345" \
  --security-contact "contact@blockxnet.com"
```

You can use this nodes before as seeds to start the network. You can configure it under the config.toml file located in .blockxd/config folder

```sh
seeds="479dfa1948f49b08810cd16bf6c2d3256ae85423@137.184.7.64:26656,e15f4d31281036c69fa17269d9b26ff8733511c6@147.182.238.235:26656,9b84b33d44a880a520006ae9f75ef030b259cbaf@137.184.38.212:26656,85d0069266e78896f9d9e17915cdfd271ba91dfd@146.190.153.165:26656"
```

To start the chain:
1) Using your existing genesis file, edit the genesis_time to a future date. Your genesis file is located in /root/.blockxd/config. The genesis_time is the first line in the file.

```sh
"genesis_time": "2024-01-16T12:00:00Z",
```

2) After editing the genesis_time, run ./blockxd start in which will show something like this below
```sh
Genesis time is in the future. Sleeping until then... genTime=2024-01-16T12:00:00Z server=node
Starting pprof server laddr=localhost:6060 server=node

```

3) If you're able to run it without any errors, stop the blockxd then it is now time to copy the [genesis file](./genesis.json) in this repo. It is best to make a copy of your original genesis.json file before overwriting it.

4) Run the ./blockxd start command again which should again show something like this below

```sh
Genesis time is in the future. Sleeping until then... genTime=2024-01-16T12:00:00Z server=node
Starting pprof server laddr=localhost:6060 server=node

```

If you're still having errors, you can try deleting the data folder located in /root/.blockxd except for the file named priv_validator_state.json. Check the file as well if it is the same to something like this. If not, edit it accordingly.

```sh
{
  "height": "0",
  "round": 0,
  "step": 0
}
```

To verify that the genesis.json file is correct, 'shasum -a 256 genesis.json'
```sh
363ce0d9f813c51e0cca3218049354b7472b9aa1bf0325cbd9e08f2562eb5b86
```

Ping Explorer:
[Mainnet](https://ping.blockxnet.com/blockx), 
[Testnet](https://ping.blockxnet.com/blockx-atlantis-testnet)

EVM Explorer: 
Coming soon

RPC URL: 
[https://rpc.blockxnet.com](https://rpc.blockxnet.com)

API URL:
[https://api.blockxnet.com](https://api.blockxnet.com)

Web3 RPC
[https://web3.blockxnet.com](https://web3.blockxnet.com)
