arr.1 = 5; arr.2 = 4; arr.3 = 3; arr.4 = 2; arr.5 = 1
n = 5
writes = 0

do cycleStart = 1 to n - 1
    item = arr.cycleStart
    pos = cycleStart
    do i = cycleStart + 1 to n
        if arr.i < item then pos = pos + 1
    end
    if pos = cycleStart then iterate
    do while arr.pos = item
        pos = pos + 1
    end
    tmp = arr.pos; arr.pos = item; item = tmp
    writes = writes + 1
    do while pos \= cycleStart
        pos = cycleStart
        do i = cycleStart + 1 to n
            if arr.i < item then pos = pos + 1
        end
        do while arr.pos = item
            pos = pos + 1
        end
        tmp = arr.pos; arr.pos = item; item = tmp
        writes = writes + 1
    end
end

do i = 1 to n
    call charout , arr.i ' '
end
say ''
