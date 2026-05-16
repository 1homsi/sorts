sub flip(@arr, $k) {
    my ($left, $right) = (0, $k);
    while $left < $right {
        (@arr[$left], @arr[$right]) = (@arr[$right], @arr[$left]);
        $left++; $right--;
    }
}

sub pancake-sort(@arr) {
    my $size = @arr.elems;
    while $size > 1 {
        my $max-idx = 0;
        for 1..^$size -> $i {
            $max-idx = $i if @arr[$i] > @arr[$max-idx];
        }
        if $max-idx != $size - 1 {
            flip(@arr, $max-idx) if $max-idx != 0;
            flip(@arr, $size - 1);
        }
        $size--;
    }
    @arr
}

my @arr = (3, 6, 2, 7, 4, 1, 5);
say pancake-sort(@arr);
