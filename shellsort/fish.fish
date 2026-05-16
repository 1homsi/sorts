function shell_sort
    set arr $argv
    set n (count $arr)
    set gap (math "floor($n / 2)")
    while test $gap -gt 0
        for i in (seq $gap (math "$n - 1"))
            set temp $arr[(math "$i + 1")]
            set j $i
            while test $j -ge $gap; and test $arr[(math "$j - $gap + 1")] -gt $temp
                set arr[(math "$j + 1")] $arr[(math "$j - $gap + 1")]
                set j (math "$j - $gap")
            end
            set arr[(math "$j + 1")] $temp
        end
        set gap (math "floor($gap / 2)")
    end
    echo $arr
end

shell_sort 64 34 25 12 22 11 90
