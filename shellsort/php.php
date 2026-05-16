<?php
function shellsort(&$arr) {
    $n = count($arr);
    $gap = intval($n / 2);
    while ($gap > 0) {
        for ($i = $gap; $i < $n; $i++) {
            $temp = $arr[$i];
            $j = $i;
            while ($j >= $gap && $arr[$j - $gap] > $temp) {
                $arr[$j] = $arr[$j - $gap];
                $j -= $gap;
            }
            $arr[$j] = $temp;
        }
        $gap = intval($gap / 2);
    }
}
?>
