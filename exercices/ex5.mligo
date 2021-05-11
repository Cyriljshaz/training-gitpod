type storage = int * address

// Owner address should be replaced by $(NAME_ADDR)
let owner : address = ("tz1gQcDxHLKgwqUjGNRYFV846RodVtWWWm67" : address)

type action = | Add of int| Sub of int | Reset

let add ((total, last), param: storage * int) : storage =
    if last = Tezos.sender then
        (failwith ("Error: Sender cannot add twice in a row!"): storage)
    else if param >= 10 then 
        (failwith "Error: Only amounts 0 <= 10 can be added!": storage)
    else total + param, Tezos.sender

let sub ((total, last), param: storage * int) : storage = 
    if Tezos.sender <> owner then
        (failwith ("Only the owner can substract!"): storage)
    else
        total - param, last

let reset ((_, last): storage) : storage =
    if Tezos.sender <> owner then
        (failwith ("Only the owner can reset the amount!"): storage)
    else
        0, last

let main (p , s: action * storage) =
 let storage =
   match p with
   | Add n -> add (s, n)
   | Sub n -> sub (s, n)
   | Reset -> reset s
 in ([] : operation list), storage