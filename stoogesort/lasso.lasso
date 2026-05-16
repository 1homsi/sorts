define stoogeSort(arr, first, last) => {
    local(a = #arr->get(#first + 1))
    local(b = #arr->get(#last + 1))
    if(#a > #b) => {
        #arr->get(#first + 1) = #b
        #arr->get(#last + 1) = #a
    }
    local(n = #last - #first + 1)
    if(#n > 2) => {
        local(t = integer(#n * 2 / 3))
        stoogeSort(#arr, #first, #first + #t - 1)
        stoogeSort(#arr, #last - #t + 1, #last)
        stoogeSort(#arr, #first, #first + #t - 1)
    }
}

local(arr = array(3, 1, 4, 1, 5, 9, 2, 6))
stoogeSort(#arr, 0, #arr->size - 1)
#arr->join(', ')
