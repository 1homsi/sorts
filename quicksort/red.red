Red []

extract-if: func [lst pred /local result x] [
    result: copy []
    foreach x lst [if pred x [append result x]]
    result
]

quicksort: func [lst /local pivot left middle right] [
    if 1 >= length? lst [return lst]
    pivot: pick lst (to-integer (length? lst) / 2)
    left: extract-if lst func [x] [x < pivot]
    middle: extract-if lst func [x] [x = pivot]
    right: extract-if lst func [x] [x > pivot]
    append append quicksort left middle quicksort right
]

print quicksort [3 6 8 10 1 2 1]
