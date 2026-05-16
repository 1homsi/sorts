function comb_sort
    set arr $argv
    set n (count $arr)
    set gap $n
    set sorted 0

    while test $sorted -eq 0
        set gap (math "floor($gap / 1.3)")
        test $gap -le 1; and set gap 1; and set sorted 1
        set changed 0
        for i in (seq 1 (math "$n - $gap"))
            set j (math "$i + $gap")
            if test $arr[$i] -gt $arr[$j]
                set tmp $arr[$i]
                set arr[$i] $arr[$j]
                set arr[$j] $tmp
                set changed 1
                set sorted 0
            end
        end
        test $gap -eq 1; and test $changed -eq 0; and set sorted 1
    end
    echo $arr
end
