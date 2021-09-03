# Solution to Michelson.1

The solution given by most of the students abuses `DIP` and `DIG` as they are not familiar with `DIP` or `SWAP`.

```
parameter (pair int int) ;
storage int ;
code { UNPAIR ;      # storage ; parameter
       UNPAIR ;      # storage ; b ; a
       DIG 2 ;       # b; a; storage       
       DROP ;        # b; a       
       DUP ;         # b; a; a
       PUSH int 3 ;  # b; a; a; 3
       MUL ;         # b; a; 3a
       DIG 2 ;       # a; 3a; b
       PUSH int 2;   # a; 3a; b; 2
       MUL ;         # a; 3a; 2b       
       ADD ;         # a; (3a*2b)
       MUL ;         # a * (3a*2b)       
       NIL operation ;
       PAIR }
```
# Question? 
- Can we do best than 14 instructions ? This could perhaps be a part of a new excercise, or a follow up.