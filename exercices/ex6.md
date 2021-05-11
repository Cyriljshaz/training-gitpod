# Excercice 6

Écrivez un Smart contrat qui possède un point d’entrée collect, qui permet à son propriétaire de retirer une somme en tez de la balance, en attendant au moins 2 minutes entre chaque retrait, et en ne retirant pas plus, à chaque appel, qu’une somme maximale que l’on fixe dans le storage lors du déploiement.

# Solution (Ligo)

- Code in [ex6.mligo](ex6.mligo)

- Dry-run
```sh
ligo dry-run exercices/ex6.mligo main 'Collect (100tz)' '(200tz,0)'
# > failwith("Not owner")
```

- Compile

```sh
ligo compile-contract exercices/ex6.mligo main  > exercices/ex6.tz
# Prepare storage
ligo compile-storage exercices/ex6.mligo main '(200tz,Tezos.now)'
# > (Pair 200000000 "1970-01-01T00:00:01Z")
```

- Deploy

```sh
tezos-client originate contract Collect transferring 0 from alice running exercices/ex6.tz \
--init '(Pair 200000000 "1970-01-01T00:00:01Z")' --burn-cap 0.2
# KT1Vdg25SgTAJMdg47fnvH3oFz222YHoxhgN
```

- Call

```sh
# We compile the argument from Ligo to Michelson
ligo compile-parameter exercices/ex6.mligo main 'Collect 100tz'
# > 100000000
tezos-client transfer 0 from alice to Collect --arg '100000000' --burn-cap 0.1
# > At line 23 characters 59 to 67,
#script reached FAILWITH instruction
#with "Too soon!"
#Fatal error:
#  transfer simulation failed
``` 
