local(arr = array(64, 34, 25, 12, 22, 11, 90))
local(n = #arr->size)
local(swapped = true)

while(#swapped) => {
    #swapped = false
    loop(-from=1, -to=#n-1) => {
        local(i = loop_count)
        if(#arr->get(#i) > #arr->get(#i+1)) => {
            local(tmp = #arr->get(#i))
            #arr->get(#i) = #arr->get(#i+1)
            #arr->get(#i+1) = #tmp
            #swapped = true
        }
    }
    #n--
}

#arr->join(', ')
