define is_sorted(arr::array) => {
    loop(-from=1, -to=#arr->size - 1) => {
        if(#arr->get(loop_count) > #arr->get(loop_count + 1)) => {
            return: false
        }
    }
    return: true
}

define shuffle(arr::array) => {
    local(n) = #arr->size
    loop(-from=#n, -to=2, -by=-1) => {
        local(j) = integer_random(1, loop_count)
        local(tmp) = #arr->get(loop_count)
        #arr->set(loop_count, #arr->get(#j))
        #arr->set(#j, #tmp)
    }
}

define bogosort(arr::array) => {
    while(!is_sorted(#arr)) => {
        shuffle(#arr)
    }
    return: #arr
}

local(arr) = array(3, 1, 4, 1, 5, 9, 2, 6)
stdoutnl(bogosort(#arr)->join(', '))
