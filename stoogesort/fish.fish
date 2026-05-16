function stooge_sort
    set -l arr $argv[1..-3]
    set -l first $argv[-2]
    set -l last $argv[-1]
    if test (math $arr[$first]) -gt (math $arr[$last])
        set -l tmp $arr[$first]
        set arr[$first] $arr[$last]
        set arr[$last] $tmp
    end
    set -l n (math $last - $first + 1)
    if test $n -gt 2
        set -l t (math -s0 "$n * 2 / 3")
        stooge_sort $arr $first (math $first + $t - 1)
        stooge_sort $arr (math $last - $t + 1) $last
        stooge_sort $arr $first (math $first + $t - 1)
    end
end

set arr 3 1 4 1 5 9 2 6
stooge_sort $arr 1 (count $arr)
echo $arr
