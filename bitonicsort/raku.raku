sub compare-and-swap(@arr, Int $i, Int $j, Bool $direction) {
    if $direction == (@arr[$i] > @arr[$j]) {
        (@arr[$i], @arr[$j]) = (@arr[$j], @arr[$i]);
    }
}

sub bitonic-merge(@arr, Int $lo, Int $cnt, Bool $direction) {
    if $cnt > 1 {
        my $k = $cnt div 2;
        for $lo ..^ $lo + $k -> $i {
            compare-and-swap(@arr, $i, $i + $k, $direction);
        }
        bitonic-merge(@arr, $lo, $k, $direction);
        bitonic-merge(@arr, $lo + $k, $k, $direction);
    }
}

sub bitonic-sort(@arr, Int $lo, Int $cnt, Bool $direction) {
    if $cnt > 1 {
        my $k = $cnt div 2;
        bitonic-sort(@arr, $lo, $k, True);
        bitonic-sort(@arr, $lo + $k, $k, False);
        bitonic-merge(@arr, $lo, $cnt, $direction);
    }
}

my @data = 3, 7, 4, 8, 6, 2, 1, 5;
bitonic-sort(@data, 0, @data.elems, True);
say @data;
