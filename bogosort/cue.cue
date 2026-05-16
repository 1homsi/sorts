package bogosort

import "list"

arr: [8]int & [3, 1, 4, 1, 5, 9, 2, 6]

isSorted: bool & list.IsSorted(arr)

bogosortResult: [8]int & list.Sort(arr, list.Ascending)

#IsSorted: bool
#IsSorted: {
    input: [...int]
    result: and([for i, v in input if i < len(input)-1 {v <= input[i+1]}])
}
