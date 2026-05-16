sub cocktail-sort(@arr) {
    my $swapped = True;
    my $start = 0;
    my $end = @arr.end;
    while $swapped {
        $swapped = False;
        for $start ..^ $end -> $i {
            if @arr[$i] > @arr[$i + 1] {
                (@arr[$i], @arr[$i + 1]) = (@arr[$i + 1], @arr[$i]);
                $swapped = True;
            }
        }
        last unless $swapped;
        $swapped = False;
        $end--;
        for ($end - 1) ... $start -> $i {
            if @arr[$i] > @arr[$i + 1] {
                (@arr[$i], @arr[$i + 1]) = (@arr[$i + 1], @arr[$i]);
                $swapped = True;
            }
        }
        $start++;
    }
    @arr;
}
