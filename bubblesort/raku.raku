sub bubble-sort(@arr) {
    my $n = @arr.elems;
    loop {
        my $swapped = False;
        for 0 ..^ $n - 1 -> $i {
            if @arr[$i] > @arr[$i + 1] {
                (@arr[$i], @arr[$i + 1]) = (@arr[$i + 1], @arr[$i]);
                $swapped = True;
            }
        }
        $n--;
        last unless $swapped;
    }
    @arr;
}

my @arr = (64, 34, 25, 12, 22, 11, 90);
say bubble-sort(@arr);
