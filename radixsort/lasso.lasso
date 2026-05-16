define counting_sort(arr::staticarray, exp::integer) => {
    local(n = #arr->size)
    local(output = staticarray_join(#n, 0))
    local(count = staticarray_join(10, 0))
    with x in #arr do {
        local(idx = (#x / #exp) % 10 + 1)
        #count->get(#idx) = #count->get(#idx) + 1
    }
    loop(-from=2, -to=10) => {
        #count->get(loop_count) = #count->get(loop_count) + #count->get(loop_count - 1)
    }
    loop(-from=#n, -to=1, -by=-1) => {
        local(x = #arr->get(loop_count))
        local(idx = (#x / #exp) % 10 + 1)
        #count->get(#idx) = #count->get(#idx) - 1
        #output->get(#count->get(#idx) + 1) = #x
    }
    return(#output)
}

define radix_sort(arr::staticarray) => {
    if(#arr->size == 0) => { return(#arr) }
    local(max_val = 0)
    with x in #arr do { if(#x > #max_val) => { #max_val = #x } }
    local(exp = 1)
    local(result = #arr)
    while(#max_val / #exp > 0) => {
        #result = counting_sort(#result, #exp)
        #exp = #exp * 10
    }
    return(#result)
}

local(arr = staticarray(170, 45, 75, 90, 802, 24, 2, 66))
stdoutnl(radix_sort(#arr))
