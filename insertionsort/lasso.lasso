define insertion_sort(arr::array) => {
    local(n) = #arr->size
    loop(-from=2, -to=#n) => {
        local(key) = #arr->get(loop_count)
        local(j) = loop_count - 1
        while(#j >= 1 && #arr->get(#j) > #key) => {
            #arr->get(#j + 1) = #arr->get(#j)
            #j -= 1
        }
        #arr->get(#j + 1) = #key
    }
    return #arr
}
