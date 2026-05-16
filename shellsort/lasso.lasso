define shell_sort(arr::array) => {
    local n = #arr->size
    local gap = #n / 2
    while(#gap > 0) => {
        loop(#n - #gap) => {
            local i = loop_count + #gap - 1
            local temp = #arr->get(#i + 1)
            local j = #i
            while(#j >= #gap && #arr->get(#j - #gap + 1) > #temp) => {
                #arr->set(#j + 1, #arr->get(#j - #gap + 1))
                #j -= #gap
            }
            #arr->set(#j + 1, #temp)
        }
        #gap = #gap / 2
    }
    return #arr
}

local arr = array(64, 34, 25, 12, 22, 11, 90)
stdoutnl(shell_sort(#arr)->join(', '))
