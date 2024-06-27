
<div align="center">
  <h1> BlockX Source Code</h1>
</div>


# Pre-requisites:
Go version 1.18
Ubuntu 22.04
Make
GCC

# Pre-requisite step
## Install Golang:
Install latest go version https://golang.org/doc/install

```
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
source ~/.profile
```

To verify that Golang installed
```
go version
```

It should return go version go1.18 linux/amd64


## Install Make to compile the code
sudo apt install make

## Install GCC in case GCC is not yet installed
sudo apt-get install gcc



# Compile the code
```
make install
```

This will create a blockxd file in the /root/go/bin directory

# Run a Node
To run a node, edit the run_node.sh file and change the Moniker name to whatever you want your node to be named.
```
chmod +x run_node.sh
./run_node.sh
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
Make sure to request for some BCX tokens first from the BCX Team. You will have a receiving address once you created a key from the previous instruction. Open the validator.sh file and change the values there depending on your preference
```
chmod +x validator.sh
./validator.sh
```

