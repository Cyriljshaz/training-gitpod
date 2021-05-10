type storage = int * string

let main (text, (count, full_text) : string * storage) =
    let count = count + 1
    in let full_text = full_text ^ "," ^ text
    in ([] : operation list), (count, full_text)
