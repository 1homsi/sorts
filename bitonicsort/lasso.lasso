<?lasso
local(arr = array(3, 7, 4, 8, 6, 2, 1, 5))

define compare_and_swap(arr::array, i::integer, j::integer, direction::boolean) => {
    local(ai = #arr->get(#i), aj = #arr->get(#j))
    if(#direction == (#ai > #aj)) => {
        #arr->get(#i) = #aj
        #arr->get(#j) = #ai
    }
}

define bitonic_merge(arr::array, lo::integer, cnt::integer, direction::boolean) => {
    if(#cnt > 1) => {
        local(k = #cnt / 2)
        loop(-from=#lo, -to=(#lo + #k - 1)) => {
            compare_and_swap(#arr, loop_count, loop_count + #k, #direction)
        }
        bitonic_merge(#arr, #lo, #k, #direction)
        bitonic_merge(#arr, #lo + #k, #k, #direction)
    }
}

define bitonic_sort(arr::array, lo::integer, cnt::integer, direction::boolean) => {
    if(#cnt > 1) => {
        local(k = #cnt / 2)
        bitonic_sort(#arr, #lo, #k, true)
        bitonic_sort(#arr, #lo + #k, #k, false)
        bitonic_merge(#arr, #lo, #cnt, #direction)
    }
}

bitonic_sort(#arr, 1, #arr->size, true)
output(#arr->join(', '))
?>
