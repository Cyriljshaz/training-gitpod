# Exercice 5

Écrivez un smart contrat qui stocke un compteur entier, et d’éventuelles autres informations, selon le besoin.

N'importe-qui doit pouvoir peut ajouter à ce compteur un nombre positif.


Seul le propriétaire du contrat peut retirer une valeur. Le propriétaire peut aussi remettre à 0

# Solution

- Code in ex5.mligo

- Compile
``
ligo compile-contract solutions/ex5.mligo main > solutions/ex5.tz
``

- Deploy

``
tezos-client originate contract EX5 transferring 0 from alice running solutions/ex5.tz --init 'Pair 0 "tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx"' --burn-cap 0.2
#KT1R6ma8sXeUovjdUtsrrWycHkRHWqMABVi3
``

- Call

``
# Testing this contract requires multiple accounts
tezos-client activate account bob with tz1axczhJP7zwZSqJ3MDTqmEsF1qsug9faC3.json
tezos-client transfer 0 from alice to EX5 --arg '(Left (Left 9))' --burn-cap 0.1
tezos-client transfer 0 from alice to EX5 --arg '(Left (Left 9))' --burn-cap 0.1
# At line 16 characters 88 to 96,
# script reached FAILWITH instruction
# with "Error: Sender cannot add twice in a row!"
tezos-client transfer 0 from alice to EX5 --arg '(Right 4)' --burn-cap 0.1
tezos-client transfer 0 from bob to EX5 --arg '(Left (Left 5))' --burn-cap 0.1
tezos-client transfer 0 from bob to EX5 --arg '(Right 10)' --burn-cap 0.1
# At line 39 characters 73 to 81,
# script reached FAILWITH instruction
# with "Only the owner can substract!"
tezos-client transfer 0 from alice to EX5 --arg '(Left (Left 1000))' --burn-cap 0.1
# At line 23 characters 27 to 35,
# script reached FAILWITH instruction
# with "Error: Only amounts 0 <= 10 can be added!"
tezos-client transfer 0 from alice to EX5 --arg '(Left (Left 9))' --burn-cap 0.1
tezos-client transfer 0 from alice to EX5 --arg '(Left (Right Unit))' --burn-cap 0.1
``
