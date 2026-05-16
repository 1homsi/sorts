define pancake_flip(arr, k) => {
    local(left = 0, right = #k, tmp)
    while(#left < #right) => {
        #tmp = #arr->get(#left + 1)
        #arr->get(#left + 1) = #arr->get(#right + 1)
        #arr->get(#right + 1) = #tmp
        #left += 1
        #right -= 1
    }
}

define find_max_idx(arr, size) => {
    local(max_idx = 0, i = 1)
    while(#i < #size) => {
        if(#arr->get(#i + 1) > #arr->get(#max_idx + 1)) => {
            #max_idx = #i
        }
        #i += 1
    }
    return #max_idx
}

define pancake_sort(arr) => {
    local(size = #arr->size)
    while(#size > 1) => {
        local(mi = find_max_idx(#arr, #size))
        if(#mi != #size - 1) => {
            if(#mi != 0) => { pancake_flip(#arr, #mi) }
            pancake_flip(#arr, #size - 1)
        }
        #size -= 1
    }
    return #arr
}

local(arr = array(3, 6, 2, 7, 4, 1, 5))
stdoutnl(pancake_sort(#arr))
