function counting_sort
    set arr $argv[1..-2]
    set exp $argv[-1]
    set n (count $arr)
    set -l count
    for i in (seq 0 9)
        set count[$i] 0
    end
    for x in $arr
        set idx (math "($x / $exp) % 10")
        set count[$idx] (math $count[$idx] + 1)
    end
    for i in (seq 1 9)
        set prev (math $i - 1)
        set count[$i] (math $count[$i] + $count[$prev])
    end
    set -l output
    for i in (seq 1 $n)
        set output[$i] 0
    end
    for i in (seq $n -1 1)
        set x $arr[$i]
        set idx (math "($x / $exp) % 10")
        set count[$idx] (math $count[$idx] - 1)
        set pos (math $count[$idx] + 1)
        set output[$pos] $x
    end
    echo $output
end

function radix_sort
    set arr $argv
    set max $arr[1]
    for x in $arr
        if test $x -gt $max
            set max $x
        end
    end
    set exp 1
    while test (math "$max / $exp") -gt 0
        set arr (counting_sort $arr $exp)
        set exp (math "$exp * 10")
    end
    echo $arr
end

radix_sort 170 45 75 90 802 24 2 66
