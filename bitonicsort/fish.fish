set -g arr 3 7 4 8 6 2 1 5

function compare_and_swap --argument-names i j dir
    set ai $arr[$i]
    set aj $arr[$j]
    if test $dir -eq 1 -a $ai -gt $aj; or test $dir -eq 0 -a $ai -lt $aj
        set arr[$i] $aj
        set arr[$j] $ai
    end
end

function bitonic_merge --argument-names lo cnt dir
    if test $cnt -gt 1
        set k (math $cnt / 2)
        for i in (seq $lo (math $lo + $k - 1))
            compare_and_swap $i (math $i + $k) $dir
        end
        bitonic_merge $lo $k $dir
        bitonic_merge (math $lo + $k) $k $dir
    end
end

function bitonic_sort --argument-names lo cnt dir
    if test $cnt -gt 1
        set k (math $cnt / 2)
        bitonic_sort $lo $k 1
        bitonic_sort (math $lo + $k) $k 0
        bitonic_merge $lo $cnt $dir
    end
end

bitonic_sort 1 (count $arr) 1
echo $arr
