function cocktail_sort
    set arr $argv
    set n (count $arr)
    set swapped 1
    set start 1
    set ending $n
    while test $swapped -eq 1
        set swapped 0
        for i in (seq $start (math $ending - 1))
            set i1 (math $i + 1)
            if test $arr[$i] -gt $arr[$i1]
                set tmp $arr[$i]
                set arr[$i] $arr[$i1]
                set arr[$i1] $tmp
                set swapped 1
            end
        end
        if test $swapped -eq 0
            break
        end
        set swapped 0
        set ending (math $ending - 1)
        for i in (seq (math $ending - 1) -1 $start)
            set i1 (math $i + 1)
            if test $arr[$i] -gt $arr[$i1]
                set tmp $arr[$i]
                set arr[$i] $arr[$i1]
                set arr[$i1] $tmp
                set swapped 1
            end
        end
        set start (math $start + 1)
    end
    echo $arr
end
