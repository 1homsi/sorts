function merge -a left right
    set result
    set i 1; set j 1
    set llen (count $left); set rlen (count $right)
    while test $i -le $llen; and test $j -le $rlen
        if test $left[$i] -le $right[$j]
            set result $result $left[$i]; set i (math $i + 1)
        else
            set result $result $right[$j]; set j (math $j + 1)
        end
    end
    while test $i -le $llen; set result $result $left[$i]; set i (math $i + 1); end
    while test $j -le $rlen; set result $result $right[$j]; set j (math $j + 1); end
    echo $result
end

function merge_sort -a arr
    set n (count $arr)
    if test $n -le 1; echo $arr; return; end
    set mid (math $n / 2)
    set left_part (merge_sort $arr[1..$mid])
    set right_part (merge_sort $arr[(math $mid + 1)..$n])
    merge $left_part $right_part
end

set arr 38 27 43 3 9 82 10
merge_sort $arr
