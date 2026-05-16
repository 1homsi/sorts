function insertion_sort
    set arr $argv
    set n (count $arr)
    for i in (seq 2 $n)
        set key $arr[$i]
        set j (math $i - 1)
        while test $j -ge 1 -a $arr[$j] -gt $key
            set arr[(math $j + 1)] $arr[$j]
            set j (math $j - 1)
        end
        set arr[(math $j + 1)] $key
    end
    echo $arr
end
