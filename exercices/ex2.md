# Execercise 2

Déployez et appelez une copie du contrat de l’exercice 1. Vous trouverez son code sur better call dev.

## Solution
- Download the source code in [ex2.tz](ex2.tz)

- Deploy,
``
  tezos-client originate contract Hello transferring 0 from alice running solutions/ex2.tz --init '""' --burn-cap 0.1
``
- Call,
``
tezos-client --wait none transfer 0 from alice to KT1QTdhr1tWyCAjxYS5Ag4HymV3H5ySKcWzi --arg '"Syntax"' --burn-cap 0.1
``
