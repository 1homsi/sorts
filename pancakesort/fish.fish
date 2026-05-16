#!/usr/bin/env fish

set -g arr 3 6 2 7 4 1 5

function flip
    set k $argv[1]
    set left 1
    set right (math $k + 1)
    while test $left -lt $right
        set tmp $arr[$left]
        set arr[$left] $arr[$right]
        set arr[$right] $tmp
        set left (math $left + 1)
        set right (math $right - 1)
    end
end

function find_max_idx
    set size $argv[1]
    set max_idx 1
    for i in (seq 2 $size)
        if test $arr[$i] -gt $arr[$max_idx]
            set max_idx $i
        end
    end
    echo $max_idx
end

set size (count $arr)
while test $size -gt 1
    set max_idx (find_max_idx $size)
    if test $max_idx -ne $size
        if test $max_idx -ne 1
            flip (math $max_idx - 1)
        end
        flip (math $size - 1)
    end
    set size (math $size - 1)
end

echo $arr
