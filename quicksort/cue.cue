package quicksort

import "list"

#Quicksort: {
    input: [...int]
    output: list.Sort(input, list.Ascending)
}

result: #Quicksort & {
    input: [3, 6, 8, 10, 1, 2, 1]
}
