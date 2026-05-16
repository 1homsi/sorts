set arr 12 11 13 5 6 7
set n (count $arr)

function heapify
    set -l n $argv[1]
    set -l i $argv[2]
    set -l largest $i
    set -l left (math "2 * $i + 1")
    set -l right (math "2 * $i + 2")
    if test $left -lt $n; and test $arr[$left] -gt $arr[$largest]
        set largest $left
    end
    if test $right -lt $n; and test $arr[$right] -gt $arr[$largest]
        set largest $right
    end
    if test $largest -ne $i
        set tmp $arr[$i]
        set arr[$i] $arr[$largest]
        set arr[$largest] $tmp
        heapify $n $largest
    end
end

for i in (seq (math "floor($n / 2) - 1") -1 0)
    heapify $n $i
end

for i in (seq (math "$n - 1") -1 1)
    set tmp $arr[1]
    set arr[1] $arr[$i]
    set arr[$i] $tmp
    heapify $i 0
end

echo $arr
