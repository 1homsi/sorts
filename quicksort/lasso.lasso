define quicksort(arr::staticarray) => {
    if(#arr->size <= 1) => { return(#arr) }
    local(pivot = #arr->get(#arr->size / 2))
    local(left = array(), middle = array(), right = array())
    with x in #arr do {
        if(#x < #pivot) => { #left->insert(#x) }
        else(#x == #pivot) => { #middle->insert(#x) }
        else => { #right->insert(#x) }
    }
    return(quicksort(#left->asstaticarray) + #middle + quicksort(#right->asstaticarray))
}

local(arr = staticarray(3, 6, 8, 10, 1, 2, 1))
stdoutnl(quicksort(#arr))
