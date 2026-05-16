define cocktailSort(arr::array) => {
    local(swapped = true, start = 1, ending = #arr->size)
    while(#swapped) => {
        #swapped = false
        loop(-from=#start, -to=#ending-1) => {
            local(i = loop_count)
            if(#arr->get(#i) > #arr->get(#i+1)) => {
                local(tmp = #arr->get(#i))
                #arr->get(#i) = #arr->get(#i+1)
                #arr->get(#i+1) = #tmp
                #swapped = true
            }
        }
        if(not #swapped) => { return(#arr) }
        #swapped = false
        #ending -= 1
        loop(-from=#ending-1, -to=#start, -by=-1) => {
            local(i = loop_count)
            if(#arr->get(#i) > #arr->get(#i+1)) => {
                local(tmp = #arr->get(#i))
                #arr->get(#i) = #arr->get(#i+1)
                #arr->get(#i+1) = #tmp
                #swapped = true
            }
        }
        #start += 1
    }
    return(#arr)
}
