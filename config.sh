export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=yes
tezos-client --endpoint https://hangzhounet.api.tez.ie config update
#tezos-client activate account alice with [path of the json faucet file]
# activation just in case
tezos-client activate account german with /workspace/training-gitpod/tz1TDXyvTQPyaxb7unwiPEtFJPVLYXHV3cra.json --force
tezos-client activate account german2 with /workspace/training-gitpod/tz1YEkaaE2jY9H6XDnSSTVS4KPWDo3LAYZSP.json --force
