/* Counting Sort in REXX */
arr = "4 2 2 8 3 3 1"
n = words(arr)
mn = word(arr, 1)
mx = word(arr, 1)
do i = 1 to n
    v = word(arr, i)
    if v < mn then mn = v
    if v > mx then mx = v
end
range = mx - mn + 1
do i = 0 to range - 1
    cnt.i = 0
end
do i = 1 to n
    v = word(arr, i)
    idx = v - mn
    cnt.idx = cnt.idx + 1
end
do i = 1 to range - 1
    cnt.i = cnt.i + cnt.(i-1)
end
do i = 0 to n - 1
    out.i = 0
end
do i = n to 1 by -1
    v = word(arr, i)
    idx = v - mn
    cnt.idx = cnt.idx - 1
    pos = cnt.idx
    out.pos = v
end
result = ""
do i = 0 to n - 1
    result = result out.i
end
say result
