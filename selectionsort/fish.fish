function selection_sort
    set arr $argv
    set n (count $arr)
    for i in (seq 1 $n)
        set min_idx $i
        for j in (seq (math $i + 1) $n)
            if test $arr[$j] -lt $arr[$min_idx]
                set min_idx $j
            end
        end
        set tmp $arr[$i]
        set arr[$i] $arr[$min_idx]
        set arr[$min_idx] $tmp
    end
    echo $arr
end
