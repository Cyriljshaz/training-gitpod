# Solution to the First.3 Excercise
>*Exercise 3*
>- Change the contract from the previous exercise, by adding to the Storage, the number of times that it was called.
>- it's just a counter, you set it to 0 initially, and every time you call the contract, it should be incremented by 1
>- Use dry-run to test this contract.

# Dry run

```
ligo dry-run solutions/exo_first_3.jsligo main '"German"' '["Hello",0]'
( LIST_EMPTY() , ( "Hello, German" , 1 ) )
ligo dry-run solutions/exo_first_3.jsligo main '"German"' '["Hello, Man",1]'
( LIST_EMPTY() , ( "Hello, Man, German" , 2 ) )
```

# Bonus: origination and interaction

```
ligo compile-storage solutions/exo_first_3.jsligo main '["Hello",0]'
(Pair "Hello" 0)

tezos-client originate contract first3 transferring 0 from german running solutions/exo_first_3.tz --init '(Pair "Hello"0)' --burn-cap 0.1
KT1NiT1rjXJ52d5o7t4qKN4296yWs4mteNF2
```
