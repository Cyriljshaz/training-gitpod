# Configure the Tezos client to interact with a florencenet public node
tezos-client --endpoint https://florence-tezos.giganode.io config update

# Disable test network warning
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=yes

#activate an account from a faucet .json file
tezos-client activate account <name> with <path>

# Save <name_address>
# can also be recovered with
# tezos-client list known addresses

export NAME_ADDR="<ADDR>"

# It might be useful to also save contract addresses
# tezos-client list known contracts

# eg. for ex1

export EX1_ADDRESS="KT1Bdwq55vVHsmRqXy79GHLcgfb5XPUPN5Wt"




