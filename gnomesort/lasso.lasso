define gnome_sort(arr::array) => {
    local(i = 0, n = #arr->size, tmp)
    while(#i < #n) => {
        if(#i == 0 || #arr->get(#i + 1) >= #arr->get(#i)) => {
            #i++
        else
            #tmp = #arr->get(#i + 1)
            #arr->get(#i + 1) = #arr->get(#i)
            #arr->get(#i) = #tmp
            #i--
        }
    }
    return #arr
}
