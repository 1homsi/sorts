sub shell-sort(@arr) {
    my $n = @arr.elems;
    my $gap = $n div 2;
    while $gap > 0 {
        for $gap ..^ $n -> $i {
            my $temp = @arr[$i];
            my $j = $i;
            while $j >= $gap && @arr[$j - $gap] > $temp {
                @arr[$j] = @arr[$j - $gap];
                $j -= $gap;
            }
            @arr[$j] = $temp;
        }
        $gap = $gap div 2;
    }
    @arr
}

my @arr = (64, 34, 25, 12, 22, 11, 90);
say shell-sort(@arr);
