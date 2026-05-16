module cocktailSort

import StdEnv

cocktailSort :: {Int} -> {Int}
cocktailSort arr
    #! n = size arr
    = go arr 0 (n-1) True
  where
    go arr s e False = arr
    go arr s e True
        #! (arr1, sw1) = fwd arr s e False
        | not sw1 = arr1
        #! (arr2, sw2) = bwd arr1 s (e-1) False
        = go arr2 (s+1) (e-1) sw2

    fwd arr i e sw
        | i >= e = (arr, sw)
        | arr.[i] > arr.[i+1]
            #! arr1 = {arr & [i]=arr.[i+1], [i+1]=arr.[i]}
            = fwd arr1 (i+1) e True
        = fwd arr (i+1) e sw

    bwd arr i s sw
        | i < s = (arr, sw)
        | arr.[i] > arr.[i+1]
            #! arr1 = {arr & [i]=arr.[i+1], [i+1]=arr.[i]}
            = bwd arr1 (i-1) s True
        = bwd arr (i-1) s sw

Start = cocktailSort {5,3,8,1,9,2,7,4,6,0}
