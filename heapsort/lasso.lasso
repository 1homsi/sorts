define heapify(arr::staticarray, n::integer, i::integer) => {
    local(largest = #i, left = 2 * #i + 1, right = 2 * #i + 2)
    if(#left < #n && #arr->get(#left + 1) > #arr->get(#largest + 1)) => { #largest = #left }
    if(#right < #n && #arr->get(#right + 1) > #arr->get(#largest + 1)) => { #largest = #right }
    if(#largest != #i) => {
        local(tmp = #arr->get(#i + 1))
        #arr->set(#i + 1, #arr->get(#largest + 1))
        #arr->set(#largest + 1, #tmp)
        heapify(#arr, #n, #largest)
    }
}

define heapsort(arr::staticarray) => {
    local(n = #arr->size)
    loop(-from=(#n / 2 - 1), -to=0, -by=-1) => {
        heapify(#arr, #n, loop_count - 1)
    }
    loop(-from=(#n - 1), -to=1, -by=-1) => {
        local(i = loop_count, tmp = #arr->get(1))
        #arr->set(1, #arr->get(#i + 1))
        #arr->set(#i + 1, #tmp)
        heapify(#arr, #i, 0)
    }
    return #arr
}

local(arr = staticarray(12, 11, 13, 5, 6, 7))
stdoutnl(heapsort(#arr))
