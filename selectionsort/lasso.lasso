define selection_sort(arr::array) => {
    local n = #arr->size
    loop(#n) => {
        local i = loop_count
        local min_idx = #i
        loop(-from=#i+1, -to=#n) => {
            local j = loop_count
            if #arr->get(#j) < #arr->get(#min_idx) => {
                #min_idx = #j
            }
        }
        local tmp = #arr->get(#i)
        #arr->set(#i, #arr->get(#min_idx))
        #arr->set(#min_idx, #tmp)
    }
    return #arr
}
