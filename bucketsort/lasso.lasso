define insertion_sort(bucket::array) => {
    local(n = #bucket->size)
    loop(#n - 1) => {
        local(i = loop_count, key = #bucket->get(#i + 1))
        local(j = #i)
        while(#j >= 1 && #bucket->get(#j) > #key) => {
            #bucket->set(#j + 1, #bucket->get(#j))
            #j--
        }
        #bucket->set(#j + 1, #key)
    }
    return #bucket
}

define bucket_sort(arr::array) => {
    local(n = #arr->size)
    #n == 0 ? return #arr
    local(min_v = #arr->get(1), max_v = #arr->get(1))
    with v in #arr do => {
        #v < #min_v ? #min_v = #v
        #v > #max_v ? #max_v = #v
    }
    local(buckets = array)
    loop(#n) => { #buckets->insert(array) }
    with num in #arr do => {
        local(idx = integer((#num - #min_v) / (#max_v - #min_v + 1) * #n) + 1)
        #idx > #n ? #idx = #n
        #buckets->get(#idx)->insert(#num)
    }
    local(result = array)
    with b in #buckets do => {
        with v in insertion_sort(#b) do => { #result->insert(#v) }
    }
    return #result
}

local(data = array(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68))
local(sorted = bucket_sort(#data))
#sorted
