define comb_sort(arr::array) => {
    local(n) = #arr->size
    local(gap) = #n
    local(sorted) = false
    while(not #sorted) => {
        #gap = integer(#gap / 1.3)
        if(#gap <= 1) => {
            #gap = 1
            #sorted = true
        }
        loop(-from=1, -to=#n - #gap) => {
            local(i) = loop_count
            local(j) = #i + #gap
            if(#arr->get(#i) > #arr->get(#j)) => {
                local(tmp) = #arr->get(#i)
                #arr->get(#i) = #arr->get(#j)
                #arr->get(#j) = #tmp
                #sorted = false
            }
        }
    }
    return #arr
}
