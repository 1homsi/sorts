function is_sorted
    set arr $argv
    set n (count $arr)
    for i in (seq 1 (math $n - 1))
        set j (math $i + 1)
        if test $arr[$i] -gt $arr[$j]
            return 1
        end
    end
    return 0
end

function shuffle
    set arr $argv
    set n (count $arr)
    for i in (seq $n -1 2)
        set j (random 1 $i)
        set tmp $arr[$i]
        set arr[$i] $arr[$j]
        set arr[$j] $tmp
    end
    echo $arr
end

set arr 3 1 4 1 5 9 2 6

while not is_sorted $arr
    set arr (shuffle $arr)
end

echo $arr
