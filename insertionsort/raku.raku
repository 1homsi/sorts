sub insertion-sort(@arr) {
    for 1 ..^ @arr.elems -> $i {
        my $key = @arr[$i];
        my $j = $i - 1;
        while $j >= 0 && @arr[$j] > $key {
            @arr[$j + 1] = @arr[$j];
            $j--;
        }
        @arr[$j + 1] = $key;
    }
    @arr
}
