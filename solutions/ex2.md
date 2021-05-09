# Execercise 2

Déployez et appelez une copie du contrat de l’exercice 1. Vous trouverez son code sur better call dev.

## Sol
- Download the source code in [ex2.tz](ex2.tz)

To deploy,
``
  tezos-client originate contract Hello transferring 0 from alice running solutions/ex2.tz --init '""' --burn-cap 0.1
``
