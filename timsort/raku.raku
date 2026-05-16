my constant MIN-RUN = 32;

sub insertion-sort(@arr, $left, $right) {
    for ($left + 1) .. $right -> $i {
        my $key = @arr[$i];
        my $j = $i - 1;
        while $j >= $left && @arr[$j] > $key {
            @arr[$j + 1] = @arr[$j];
            $j--;
        }
        @arr[$j + 1] = $key;
    }
}

sub merge(@arr, $left, $mid, $right) {
    my @lp = @arr[$left .. $mid];
    my @rp = @arr[($mid + 1) .. $right];
    my ($i, $j, $k) = (0, 0, $left);
    while $i < @lp.elems && $j < @rp.elems {
        if @lp[$i] <= @rp[$j] { @arr[$k++] = @lp[$i++]; }
        else { @arr[$k++] = @rp[$j++]; }
    }
    while $i < @lp.elems { @arr[$k++] = @lp[$i++]; }
    while $j < @rp.elems { @arr[$k++] = @rp[$j++]; }
}

sub timsort(@arr) {
    my $n = @arr.elems;
    my $i = 0;
    while $i < $n {
        insertion-sort(@arr, $i, min($i + MIN-RUN - 1, $n - 1));
        $i += MIN-RUN;
    }
    my $size = MIN-RUN;
    while $size < $n {
        my $left = 0;
        while $left < $n {
            my $mid = min($left + $size - 1, $n - 1);
            my $right = min($left + 2 * $size - 1, $n - 1);
            merge(@arr, $left, $mid, $right) if $mid < $right;
            $left += 2 * $size;
        }
        $size *= 2;
    }
    @arr
}

my @arr = 5, 2, 8, 1, 9, 3, 7, 4, 6;
say timsort(@arr);
