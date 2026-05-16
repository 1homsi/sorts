arr.1 = 170; arr.2 = 45; arr.3 = 75; arr.4 = 90
arr.5 = 802; arr.6 = 24; arr.7 = 2; arr.8 = 66
n = 8

maxVal = arr.1
do i = 2 to n
    if arr.i > maxVal then maxVal = arr.i
end

exp = 1
do while maxVal % exp > 0
    do i = 0 to 9; cnt.i = 0; end
    do i = 1 to n
        idx = arr.i % exp // 10
        cnt.idx = cnt.idx + 1
    end
    do i = 1 to 9
        cnt.i = cnt.i + cnt.(i-1)
    end
    do i = n to 1 by -1
        idx = arr.i % exp // 10
        cnt.idx = cnt.idx - 1
        out.(cnt.idx) = arr.i
    end
    do i = 1 to n; arr.i = out.(i-1); end
    exp = exp * 10
end

result = ''
do i = 1 to n
    result = result arr.i
end
say Strip(result)
