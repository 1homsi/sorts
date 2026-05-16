local(arr = array(5, 4, 3, 2, 1))
local(n = #arr->size)
local(writes = 0)

loop(-from=1, -to=(#n - 1)) => {
    local(cycle_start = loop_count)
    local(item = #arr->get(#cycle_start))
    local(pos = #cycle_start)
    loop(-from=(#cycle_start + 1), -to=#n) => {
        local(i = loop_count)
        if(#arr->get(#i) < #item) => {
            #pos += 1
        }
    }
    if(#pos != #cycle_start) => {
        while(#arr->get(#pos) == #item) => {
            #pos += 1
        }
        local(tmp = #arr->get(#pos))
        #arr->set(#pos, #item)
        #item = #tmp
        #writes += 1
        while(#pos != #cycle_start) => {
            #pos = #cycle_start
            loop(-from=(#cycle_start + 1), -to=#n) => {
                local(i = loop_count)
                if(#arr->get(#i) < #item) => { #pos += 1 }
            }
            while(#arr->get(#pos) == #item) => { #pos += 1 }
            local(t = #arr->get(#pos))
            #arr->set(#pos, #item)
            #item = #t
            #writes += 1
        }
    }
}

#arr
