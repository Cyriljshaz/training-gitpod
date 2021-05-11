# Excercice 4

Modifiez le contrat de l’exercice précédent, en ajoutant au storage, le nombre de fois où on l’a appelé.

Utilisez dry-run pour le tester.

# Solution

- Code in [ex4.mligo](ex4.mligo)

- Compile to ex4.tz

``
ligo compile-contract solutions/ex4.mligo main > solutions/ex4.tz
``

- Deploy:

``
tezos-client originate contract EX4 transferring 0 from alice running solutions/ex4.tz --init 'Pair 4 ""' --burn-cap 0.1
# KT1MPd5bDqG3hpWdqKemgqKt9QLhKb9yo6Wp
``

- Call:
``
tezos-client transfer 0 from alice to EX4 --arg '"First"' --burn-cap 0.1
``