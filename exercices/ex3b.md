#Exercice 3b

Créez un contrat LIGO dont le storage initial est une chaîne.

Le contrat doit prendre un paramètre de type chaîne.

Lorsqu’on l’appelle, il doit ajouter une virgule, puis cette chaîne au bout du storage.

Utilisez dry-run pour tester ce contrat

# Solution

- Code dans [ex3b.mligo](ex3b.mligo)

- Dry-run
``
    ligo dry-run solutions/ex3b.mligo main '"Hello"' '"World"'
# ( LIST_EMPTY() , "World,Hello" )
``
- Compile
``` 
ligo compile-contract solutions/ex3b.mligo main > solutions/ex3a.tz
```
- Deploy
``
tezos-client originate contract HELLO transferring 0 from alice running solutions/ex3b.tz --init '"Hello "' --burn-cap 0.1
# KT1CSiVE5KnJxxq45kjJ7JrMf6xSCUsxAsu1
``
- Call
```
    tezos-client transfer 0 from alice to HELLO --arg '"Bob"' --burn-cap 0.1
```

