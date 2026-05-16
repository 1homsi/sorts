<?php
function cycleSort(array &$arr): int {
    $writes = 0;
    $n = count($arr);
    for ($cycleStart = 0; $cycleStart < $n - 1; $cycleStart++) {
        $item = $arr[$cycleStart];
        $pos = $cycleStart;
        for ($i = $cycleStart + 1; $i < $n; $i++) {
            if ($arr[$i] < $item) $pos++;
        }
        if ($pos === $cycleStart) continue;
        while ($item === $arr[$pos]) $pos++;
        [$arr[$pos], $item] = [$item, $arr[$pos]];
        $writes++;
        while ($pos !== $cycleStart) {
            $pos = $cycleStart;
            for ($i = $cycleStart + 1; $i < $n; $i++) {
                if ($arr[$i] < $item) $pos++;
            }
            while ($item === $arr[$pos]) $pos++;
            [$arr[$pos], $item] = [$item, $arr[$pos]];
            $writes++;
        }
    }
    return $writes;
}

$arr = [5, 4, 3, 2, 1];
cycleSort($arr);
echo implode(" ", $arr) . "\n";
