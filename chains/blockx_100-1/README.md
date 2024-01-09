<!-- generated file - do not edit -->
# 🔗 `blockx_100-1`

![chain-id](https://img.shields.io/badge/chain%20id-blockx__100--1-blue?style=for-the-badge)
![stability-stable](https://img.shields.io/badge/stability-stable-green.svg?style=for-the-badge)
![audience](https://img.shields.io/badge/audience-public-white.svg?style=for-the-badge)
![genesis-time](https://img.shields.io/badge/%E2%8F%B0%20genesis%20time-2024--01--10T12%3A00_UTC-blue?style=for-the-badge)

## Register in the Genesis

> ℹ️ **Registration has ended last January 5, 2024 🧙‍♂️**. See [Nemeton program](https://nemeton.okp4.network/).

Interested Validators had to submit their gentx 

```sh
# Init node
blockxd init your-moniker --chain-id blockx_100-1

# Create keys, make sure that you store the generated mnemonics somewhere safe.
blockxd keys add your-key-name

# Set account necessary balance
blockxd add-genesis-account your-key-name 100000000000000000000000abcx
```

You can also edit the other values such as commission rate, website, contact and others.

```sh
# Create the gentx
blockxd gentx your-key-name 100000000000000000000000abcx \
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

