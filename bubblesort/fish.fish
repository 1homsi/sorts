function bubble_sort
    set arr $argv
    set n (count $arr)
    set swapped 1
    while test $swapped -eq 1
        set swapped 0
        for i in (seq 1 (math $n - 1))
            set j (math $i + 1)
            if test $arr[$i] -gt $arr[$j]
                set tmp $arr[$i]
                set arr[$i] $arr[$j]
                set arr[$j] $tmp
                set swapped 1
            end
        end
        set n (math $n - 1)
    end
    echo $arr
end

bubble_sort 64 34 25 12 22 11 90
