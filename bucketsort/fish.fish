function insertion_sort
    set -l bucket $argv
    set -l n (count $bucket)
    for i in (seq 2 $n)
        set -l key $bucket[$i]
        set -l j (math $i - 1)
        while test $j -ge 1; and test (math "$bucket[$j] > $key") -eq 1
            set bucket[(math $j + 1)] $bucket[$j]
            set j (math $j - 1)
        end
        set bucket[(math $j + 1)] $key
    end
    echo $bucket
end

function bucket_sort
    set -l arr $argv
    set -l n (count $arr)
    test $n -eq 0; and echo $arr; and return
    set -l min_v $arr[1]
    set -l max_v $arr[1]
    for v in $arr
        test (math "$v < $min_v") -eq 1; and set min_v $v
        test (math "$v > $max_v") -eq 1; and set max_v $v
    end
    for i in (seq 1 $n)
        set -g bucket_$i
    end
    for num in $arr
        set -l idx (math "min($n - 1, floor(($num - $min_v) / ($max_v - $min_v + 1) * $n))")
        set -l bidx (math $idx + 1)
        eval "set -ga bucket_$bidx $num"
    end
    set -l result
    for i in (seq 1 $n)
        eval "set -l b \$bucket_$i"
        if test (count $b) -gt 0
            set result $result (insertion_sort $b)
        end
    end
    echo $result
end

set data 0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68
echo (bucket_sort $data)
