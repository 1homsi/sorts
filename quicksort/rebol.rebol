REBOL []

quicksort: func [lst] [
    if 1 >= length? lst [return lst]
    pivot: pick lst to-integer (length? lst) / 2
    left: extract-if lst func [x] [x < pivot]
    middle: extract-if lst func [x] [x = pivot]
    right: extract-if lst func [x] [x > pivot]
    append append quicksort left middle quicksort right
]

extract-if: func [lst pred] [
    result: copy []
    foreach x lst [if pred x [append result x]]
    result
]

print quicksort [3 6 8 10 1 2 1]
