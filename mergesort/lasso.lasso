define merge(left::staticarray, right::staticarray) => {
    local(result = staticarray, i = 1, j = 1)
    while(#i <= #left->size && #j <= #right->size) => {
        if(#left->get(#i) <= #right->get(#j)) => {
            #result->insert(#left->get(#i))
            #i++
        else
            #result->insert(#right->get(#j))
            #j++
        }
    }
    while(#i <= #left->size) => {
        #result->insert(#left->get(#i))
        #i++
    }
    while(#j <= #right->size) => {
        #result->insert(#right->get(#j))
        #j++
    }
    return(#result)
}

define mergeSort(arr::staticarray) => {
    local(n = #arr->size)
    if(#n <= 1) => { return(#arr) }
    local(mid = integer(#n / 2))
    local(left = mergeSort(#arr->copyrange(1, #mid)))
    local(right = mergeSort(#arr->copyrange(#mid + 1, #n)))
    return(merge(#left, #right))
}

local(arr = staticarray(38, 27, 43, 3, 9, 82, 10))
local(sorted = mergeSort(#arr))
#sorted->forEach => { ^ #1 + ' ' }
