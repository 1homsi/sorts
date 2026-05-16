<?php
function flip(&$arr, $k) {
    $left = 0; $right = $k;
    while ($left < $right) {
        [$arr[$left], $arr[$right]] = [$arr[$right], $arr[$left]];
        $left++; $right--;
    }
}

function pancakeSort(&$arr) {
    $n = count($arr);
    for ($size = $n; $size > 1; $size--) {
        $maxIdx = 0;
        for ($i = 1; $i < $size; $i++) {
            if ($arr[$i] > $arr[$maxIdx]) $maxIdx = $i;
        }
        if ($maxIdx !== $size - 1) {
            if ($maxIdx !== 0) flip($arr, $maxIdx);
            flip($arr, $size - 1);
        }
    }
}

$arr = [3, 6, 2, 7, 4, 1, 5];
pancakeSort($arr);
echo implode(", ", $arr) . "\n";
