<?php
function quicksort(array $arr): array {
    if (count($arr) <= 1) return $arr;
    $pivot = $arr[intdiv(count($arr), 2)];
    $left = array_filter($arr, fn($x) => $x < $pivot);
    $middle = array_filter($arr, fn($x) => $x === $pivot);
    $right = array_filter($arr, fn($x) => $x > $pivot);
    return array_merge(quicksort(array_values($left)), array_values($middle), quicksort(array_values($right)));
}

print_r(quicksort([3, 6, 8, 10, 1, 2, 1]));
