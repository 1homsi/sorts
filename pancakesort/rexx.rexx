arr.1 = 3; arr.2 = 6; arr.3 = 2; arr.4 = 7
arr.5 = 4; arr.6 = 1; arr.7 = 5
n = 7

size = n
do while size > 1
    maxIdx = 1
    do i = 2 to size
        if arr.i > arr.maxIdx then maxIdx = i
    end
    if maxIdx \= size then do
        if maxIdx \= 1 then call flip maxIdx - 1
        call flip size - 1
    end
    size = size - 1
end

result = ''
do i = 1 to n
    result = result arr.i
end
say result
exit

flip: procedure expose arr.
    parse arg k
    left = 1; right = k + 1
    do while left < right
        tmp = arr.left
        arr.left = arr.right
        arr.right = tmp
        left = left + 1
        right = right - 1
    end
    return
