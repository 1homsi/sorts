<?php
function shellSort(array $arr): array {
    $n = count($arr);
    for ($gap = intdiv($n, 2); $gap > 0; $gap = intdiv($gap, 2)) {
        for ($i = $gap; $i < $n; $i++) {
            $temp = $arr[$i];
            $j = $i;
            while ($j >= $gap && $arr[$j - $gap] > $temp) {
                $arr[$j] = $arr[$j - $gap];
                $j -= $gap;
            }
            $arr[$j] = $temp;
        }
    }
    return $arr;
}

$arr = [64, 34, 25, 12, 22, 11, 90];
print implode(" ", shellSort($arr)) . "\n";
