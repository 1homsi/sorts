sub stooge-sort(@arr is rw, Int $first, Int $last) {
    if @arr[$first] > @arr[$last] {
        (@arr[$first], @arr[$last]) = (@arr[$last], @arr[$first]);
    }
    if $last - $first + 1 > 2 {
        my $t = ($last - $first + 1) * 2 div 3;
        stooge-sort(@arr, $first, $first + $t - 1);
        stooge-sort(@arr, $last - $t + 1, $last);
        stooge-sort(@arr, $first, $first + $t - 1);
    }
}

my @arr = 3, 1, 4, 1, 5, 9, 2, 6;
stooge-sort(@arr, 0, @arr.end);
say @arr;
