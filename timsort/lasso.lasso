define MIN_RUN => 32

define insertion_sort(arr::array, left::integer, right::integer) => {
    local(i) = #left + 1
    while(#i <= #right) => {
        local(key) = #arr->get(#i)
        local(j) = #i - 1
        while(#j >= #left && #arr->get(#j) > #key) => {
            #arr->insert(#j + 1 = #arr->get(#j))
            #arr->remove(#j + 2)
            #j -= 1
        }
        #arr->insert(#j + 1 = #key)
        #arr->remove(#j + 2)
        #i += 1
    }
}

define merge_runs(arr::array, left::integer, mid::integer, right::integer) => {
    local(lp) = array
    local(rp) = array
    loop(-from=#left, -to=#mid) => { #lp->insert(#arr->get(loop_count)) }
    loop(-from=#mid+1, -to=#right) => { #rp->insert(#arr->get(loop_count)) }
    local(i) = 1
    local(j) = 1
    local(k) = #left
    while(#i <= #lp->size && #j <= #rp->size) => {
        if(#lp->get(#i) <= #rp->get(#j)) => {
            #arr->insert(#k = #lp->get(#i))
            #arr->remove(#k + 1)
            #i += 1
        else
            #arr->insert(#k = #rp->get(#j))
            #arr->remove(#k + 1)
            #j += 1
        }
        #k += 1
    }
    while(#i <= #lp->size) => {
        #arr->insert(#k = #lp->get(#i))
        #arr->remove(#k + 1)
        #i += 1
        #k += 1
    }
    while(#j <= #rp->size) => {
        #arr->insert(#k = #rp->get(#j))
        #arr->remove(#k + 1)
        #j += 1
        #k += 1
    }
}

local(arr) = array(5, 2, 8, 1, 9, 3, 7, 4, 6)
local(n) = #arr->size
local(i) = 1
while(#i <= #n) => {
    local(right) = math_min(#i + MIN_RUN - 1, #n)
    insertion_sort(#arr, #i, #right)
    #i += MIN_RUN
}
local(size) = MIN_RUN
while(#size < #n) => {
    local(left) = 1
    while(#left <= #n) => {
        local(mid) = math_min(#left + #size - 1, #n)
        local(right) = math_min(#left + 2 * #size - 1, #n)
        if(#mid < #right) => { merge_runs(#arr, #left, #mid, #right) }
        #left += 2 * #size
    }
    #size *= 2
}
#arr->join(', ')
