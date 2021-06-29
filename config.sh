# setup node to follow florencenet
tezos-client --endpoint https://florence-tezos.giganode.io config update
# disable testnet warning
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=yes
# Downlod a wallet from the Tezos faucet:
# https://faucet.tzalpha.net/
# and upload to the working environment
# set up the path for the wallet and a nickname for the wallet
gp env -e WALLET=
gp env -e ALIAS=
# activate the account - re-activate if gitpod needs to refresh
tezos-client activate account $ALIAS with $WALLET
# reactivation gives an error, we should improve this with some env trick
