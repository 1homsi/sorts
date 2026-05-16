function quicksort
    set arr $argv
    set n (count $arr)
    if test $n -le 1
        echo $arr
        return
    end
    set pivot_idx (math "$n / 2")
    set pivot $arr[$pivot_idx]
    set left
    set middle
    set right
    for x in $arr
        if test $x -lt $pivot
            set left $left $x
        else if test $x -eq $pivot
            set middle $middle $x
        else
            set right $right $x
        end
    end
    set sl (quicksort $left)
    set sr (quicksort $right)
    echo $sl $middle $sr
end

quicksort 3 6 8 10 1 2 1
