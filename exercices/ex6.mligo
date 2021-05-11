type storage = tez * timestamp
// replace with address
let owner : address = ("tz1gQcDxHLKgwqUjGNRYFV846RodVtWWWm67" : address)

type action = | Collect of tez

let collect ((maxAmount, lastCollectTime), requestedAmount: storage * tez) = 
    if Tezos.sender <> owner then
        (failwith ("Not owner"): operation list * storage)
    else if requestedAmount > maxAmount then
        (failwith ("Too much!"): operation list * storage)
    else if lastCollectTime + 120 < Tezos.now then
        (failwith ("Too soon!"): operation list * storage)
    else
        let receiver : unit contract =
        match (Tezos.get_contract_opt (owner): unit contract option) with
            Some contract -> contract
        | None -> (failwith "Contract not found." : unit contract) in
        let op : operation = Tezos.transaction unit requestedAmount receiver in
        ([op], (requestedAmount, Tezos.now))

let main (p,s: action * storage) =
 let result =
   match p with
   | Collect n -> collect (s, n)
 in result
   