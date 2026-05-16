<?php

function bogosort(&$arr) {
    while (!is_sorted($arr)) {
        shuffle($arr);
    }
    return $arr;
}

function is_sorted($arr) {
    for ($i = 0; $i < count($arr) - 1; $i++) {
        if ($arr[$i] > $arr[$i + 1]) return false;
    }
    return true;
}
