function gnome_sort
    set arr $argv
    set n (count $arr)
    set i 1
    while test $i -le $n
        if test $i -eq 1; or test $arr[$i] -ge $arr[(math $i - 1)]
            set i (math $i + 1)
        else
            set tmp $arr[$i]
            set arr[$i] $arr[(math $i - 1)]
            set arr[(math $i - 1)] $tmp
            set i (math $i - 1)
        end
    end
    echo $arr
end
