# Exercice 3a

Testez un dry-run du contrat LIGO donné en exemple, add_two_numbers.mligo

Puis compilez-le pour voir le contrat Michelson correspondant.

## Solutions

- Dry-run:
``
    ligo dry-run add_two_numbers.mligo main "(5, 7)" "(0, 0)"
#   ( LIST_EMPTY() , ( 5 , 7 ) )
``
- Compile:
``
    ligo compile-contract examples/add_two_numbers.mligo main > solutions/ex3a.tz

``
- Deploy:
``
    tezos-client originate contract ADD transferring 0 from alice running solutions/ex3a.tz --init 'Pair 0 0' --burn-cap 0.1
``
- Call:
``
    tezos-client --wait none transfer 0 from alice to ADD --arg 'Pair 11 17' --burn-cap 0.1
``