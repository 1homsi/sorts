function cycle_sort
    set -l arr $argv
    set -l n (count $arr)
    set -l writes 0

    for cycle_start in (seq 1 (math $n - 1))
        set -l item $arr[$cycle_start]
        set -l pos $cycle_start
        for i in (seq (math $cycle_start + 1) $n)
            if test $arr[$i] -lt $item
                set pos (math $pos + 1)
            end
        end
        if test $pos -eq $cycle_start
            continue
        end
        while test $item -eq $arr[$pos]
            set pos (math $pos + 1)
        end
        set -l tmp $arr[$pos]
        set arr[$pos] $item
        set item $tmp
        set writes (math $writes + 1)
        while test $pos -ne $cycle_start
            set pos $cycle_start
            for i in (seq (math $cycle_start + 1) $n)
                if test $arr[$i] -lt $item
                    set pos (math $pos + 1)
                end
            end
            while test $item -eq $arr[$pos]
                set pos (math $pos + 1)
            end
            set tmp $arr[$pos]
            set arr[$pos] $item
            set item $tmp
            set writes (math $writes + 1)
        end
    end
    echo $arr
end

cycle_sort 5 4 3 2 1
