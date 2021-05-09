let main (texte, storage : string * string) =
       let storage = storage ^ "," ^ texte
       in ([] : operation list), storage