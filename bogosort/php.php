<?php
function isSorted(array $arr): bool {
    for ($i = 0; $i < count($arr) - 1; $i++) {
        if ($arr[$i] > $arr[$i + 1]) return false;
    }
    return true;
}

function bogosort(array $arr): array {
    while (!isSorted($arr)) {
        shuffle($arr);
    }
    return $arr;
}

$arr = [3, 1, 4, 1, 5, 9, 2, 6];
print_r(bogosort($arr));
