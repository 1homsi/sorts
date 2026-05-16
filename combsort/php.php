<?php
function combSort(array $arr): array {
    $n = count($arr);
    $gap = $n;
    $shrink = 1.3;
    $sorted = false;
    while (!$sorted) {
        $gap = (int)($gap / $shrink);
        if ($gap <= 1) {
            $gap = 1;
            $sorted = true;
        }
        for ($i = 0; $i + $gap < $n; $i++) {
            if ($arr[$i] > $arr[$i + $gap]) {
                [$arr[$i], $arr[$i + $gap]] = [$arr[$i + $gap], $arr[$i]];
                $sorted = false;
            }
        }
    }
    return $arr;
}
