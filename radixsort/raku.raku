sub counting-sort(@arr is rw, Int $exp) {
    my $n = @arr.elems;
    my @output = 0 xx $n;
    my @count = 0 xx 10;
    for @arr -> $x { @count[($x div $exp) % 10]++ }
    for 1..9 -> $i { @count[$i] += @count[$i - 1] }
    for ($n - 1) ... 0 -> $i {
        my $idx = (@arr[$i] div $exp) % 10;
        @count[$idx]--;
        @output[@count[$idx]] = @arr[$i];
    }
    @arr = @output;
}

sub radix-sort(@arr is rw) {
    return unless @arr;
    my $max = @arr.max;
    my $exp = 1;
    while $max div $exp > 0 {
        counting-sort(@arr, $exp);
        $exp *= 10;
    }
}

my @arr = 170, 45, 75, 90, 802, 24, 2, 66;
radix-sort(@arr);
say @arr;
