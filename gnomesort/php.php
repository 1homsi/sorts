<?php
function gnomeSort(array $arr): array {
    $i = 0;
    $n = count($arr);
    while ($i < $n) {
        if ($i === 0 || $arr[$i] >= $arr[$i - 1]) {
            $i++;
        } else {
            [$arr[$i], $arr[$i - 1]] = [$arr[$i - 1], $arr[$i]];
            $i--;
        }
    }
    return $arr;
}
