# Solution to Exercise First.2

>*Exercise 2*
>- Create a LIGO contract that has a string as storage.
>- The contract should take a string as a parameter.
>- When called, it should add a comma and this parameter, at the end of the storage.
>- Use dry-run to test this contract.

# Dry run

```
ligo dry-run solutions/exo_first_2.jsligo main '"World"' '"Hello"'
( LIST_EMPTY() , "Hello,World" )
```

# Bonus origination

```
tezos-client originate contract exo2 transferring 0 from german running /workspace/training-gitpod/solutions/exo_first_2.tz --init '""' --burn-cap 0.1
KT1XeXAxvPcNt47LRNkFdBcSAqDnjxmh92Pj
```