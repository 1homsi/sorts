<?php
function stoogeSort(&$arr, $first, $last) {
    if ($arr[$first] > $arr[$last]) {
        list($arr[$first], $arr[$last]) = [$arr[$last], $arr[$first]];
    }
    if ($last - $first + 1 > 2) {
        $t = intdiv(($last - $first + 1) * 2, 3);
        stoogeSort($arr, $first, $first + $t - 1);
        stoogeSort($arr, $last - $t + 1, $last);
        stoogeSort($arr, $first, $first + $t - 1);
    }
}

$arr = [3, 1, 4, 1, 5, 9, 2, 6];
stoogeSort($arr, 0, count($arr) - 1);
echo implode(" ", $arr) . "\n";
