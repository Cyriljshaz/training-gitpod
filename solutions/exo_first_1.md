# Solution to first_1

> *Exercise 1*
>  - Do a dry-run of the LIGO contract given as an example:  `add_two_numbers.jsligo`
>  - Then compile it to Michelson and take a look at the compileed contract.

```
ligo dry-run examples/add_number/counter.jsligo main '10' '5'
(LIST_EMPTY() , 10)
```

```
ligo compile-contract examples/add_number/counter.jsligo main
{ parameter int ;
  storage int ;
  code { LEFT (pair (list operation) int) ;
         LOOP_LEFT
           { DUP ; CAR ; SWAP ; CDR ; ADD ; NIL operation ; PAIR ; RIGHT (pair int int) } } }

ligo compile-storage examples/add_number/counter.jsligo main '0'
0
```

# Bonus: Origination

```
tezos-client originate contract exo_first1 transferring 0 from german running /workspace/training-gitpod/solutions/exo_first_1.tz --init '0' --burn-cap 0.2

KT1GtvGTJs5MX9z2EARxqbDDq3AJ4awrJYeJ
``` 

```
tezos-client transfer 0 from german to exo_first1 --arg '1000' --burn-cap 0.1
```