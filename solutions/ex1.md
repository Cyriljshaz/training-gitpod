# Execercice 1

Appelez le smart contrat dont l’adresse est :

“KT1Bdwq55vVHsmRqXy79GHLcgfb5XPUPN5Wt”

Appelez-le en donnant votre prénom.

C’est un smart contrat qui prend en paramètre une chaîne. Il faut penser à mettre sous cette forme là : '"coucou"'

Allez ensuite voir le résultat sur https://better-call.dev/

# Sol

```
    tezos-client --wait none transfer 5 from alice to KT1Bdwq55vVHsmRqXy79GHLcgfb5XPUPN5Wt --arg '"Germán"' --burn-cap 0.1
```
## Gotchas
- Tezos CLI parser eats the first `'` and or `"` around `--arg`, then putting `--arg "German"` will fail, as it will pass `German` as a value which is not a string type.
- Michelson restricts the type of characters.
