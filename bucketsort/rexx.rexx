arr.1 = 0.78; arr.2 = 0.17; arr.3 = 0.39; arr.4 = 0.26; arr.5 = 0.72
arr.6 = 0.94; arr.7 = 0.21; arr.8 = 0.12; arr.9 = 0.23; arr.10 = 0.68
n = 10

minv = arr.1; maxv = arr.1
do i = 1 to n
    if arr.i < minv then minv = arr.i
    if arr.i > maxv then maxv = arr.i
end

do i = 1 to n
    cnt.i = 0
end

do i = 1 to n
    num = arr.i
    idx = trunc((num - minv) / (maxv - minv + 1) * n) + 1
    if idx > n then idx = n
    cnt.idx = cnt.idx + 1
    k = idx || '.' || cnt.idx
    bkt.k = num
end

pos = 1
do b = 1 to n
    m = cnt.b
    do i = 2 to m
        k = b || '.' || i
        key = bkt.k
        j = i - 1
        do while j >= 1
            k2 = b || '.' || j
            if bkt.k2 <= key then leave
            k3 = b || '.' || (j+1)
            bkt.k3 = bkt.k2
            j = j - 1
        end
        k4 = b || '.' || (j+1)
        bkt.k4 = key
    end
    do i = 1 to m
        k = b || '.' || i
        arr.pos = bkt.k
        pos = pos + 1
    end
end

do i = 1 to n
    say arr.i
end
