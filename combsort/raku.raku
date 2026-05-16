sub comb-sort(@arr) {
    my $n = @arr.elems;
    my $gap = $n;
    my $sorted = False;
    until $sorted {
        $gap = ($gap / 1.3).Int;
        $gap = 1 if $gap < 1;
        $sorted = True if $gap == 1;
        for 0 ..^ $n - $gap -> $i {
            if @arr[$i] > @arr[$i + $gap] {
                (@arr[$i], @arr[$i + $gap]) = (@arr[$i + $gap], @arr[$i]);
                $sorted = False;
            }
        }
    }
    @arr
}
