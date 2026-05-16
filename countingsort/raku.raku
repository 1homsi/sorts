sub counting-sort(@arr) {
    return @arr unless @arr;
    my $min = @arr.min;
    my $max = @arr.max;
    my $range = $max - $min + 1;
    my @count = 0 xx $range;
    @count[$_ - $min]++ for @arr;
    @count[$_] += @count[$_ - 1] for 1 ..^ $range;
    my @output = 0 xx @arr.elems;
    for @arr.reverse -> $v {
        @output[--@count[$v - $min]] = $v;
    }
    @output;
}

say counting-sort([4, 2, 2, 8, 3, 3, 1]);
