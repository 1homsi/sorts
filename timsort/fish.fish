set MIN_RUN 32

function insertion_sort
    set left $argv[1]
    set right $argv[2]
    set i (math $left + 1)
    while test $i -le $right
        set key $arr[$i]
        set j (math $i - 1)
        while test $j -ge $left; and test $arr[$j] -gt $key
            set next (math $j + 1)
            set arr[$next] $arr[$j]
            set j (math $j - 1)
        end
        set next (math $j + 1)
        set arr[$next] $key
        set i (math $i + 1)
    end
end

function merge_runs
    set left $argv[1]
    set mid $argv[2]
    set right $argv[3]
    set lp
    set rp
    for i in (seq $left $mid)
        set lp $lp $arr[$i]
    end
    set next (math $mid + 1)
    for i in (seq $next $right)
        set rp $rp $arr[$i]
    end
    set i 1
    set j 1
    set k $left
    set ln (count $lp)
    set rn (count $rp)
    while test $i -le $ln; and test $j -le $rn
        if test $lp[$i] -le $rp[$j]
            set arr[$k] $lp[$i]
            set i (math $i + 1)
        else
            set arr[$k] $rp[$j]
            set j (math $j + 1)
        end
        set k (math $k + 1)
    end
    while test $i -le $ln
        set arr[$k] $lp[$i]
        set i (math $i + 1)
        set k (math $k + 1)
    end
    while test $j -le $rn
        set arr[$k] $rp[$j]
        set j (math $j + 1)
        set k (math $k + 1)
    end
end

set -g arr 5 2 8 1 9 3 7 4 6
set n (count $arr)

set i 1
while test $i -le $n
    set right (math $i + $MIN_RUN - 1)
    if test $right -gt $n
        set right $n
    end
    insertion_sort $i $right
    set i (math $i + $MIN_RUN)
end

set size $MIN_RUN
while test $size -lt $n
    set left 1
    while test $left -le $n
        set mid (math $left + $size - 1)
        if test $mid -gt $n
            set mid $n
        end
        set right (math $left + 2 \* $size - 1)
        if test $right -gt $n
            set right $n
        end
        if test $mid -lt $right
            merge_runs $left $mid $right
        end
        set left (math $left + 2 \* $size)
    end
    set size (math $size \* 2)
end

echo $arr
