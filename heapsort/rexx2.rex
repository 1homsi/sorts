/* REXX heapsort */
arr.1 = 12; arr.2 = 11; arr.3 = 13; arr.4 = 5; arr.5 = 6; arr.6 = 7
n = 6

do i = n % 2 to 1 by -1
    call heapify n, i
end

do i = n to 2 by -1
    tmp = arr.1; arr.1 = arr.i; arr.i = tmp
    call heapify i-1, 1
end

out = ''
do i = 1 to n
    out = out arr.i
end
say out

heapify: procedure expose arr.
    parse arg n, i
    largest = i
    left = 2 * i
    right = 2 * i + 1
    if left <= n & arr.left > arr.largest then largest = left
    if right <= n & arr.right > arr.largest then largest = right
    if largest \= i then do
        tmp = arr.i; arr.i = arr.largest; arr.largest = tmp
        call heapify n, largest
    end
    return
