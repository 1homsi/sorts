sub cycle-sort(@arr) {
    my $writes = 0;
    my $n = @arr.elems;
    for 0 ..^ $n - 1 -> $cycle-start {
        my $item = @arr[$cycle-start];
        my $pos = $cycle-start;
        for $cycle-start + 1 ..^ $n -> $i {
            $pos++ if @arr[$i] < $item;
        }
        next if $pos == $cycle-start;
        $pos++ while $item == @arr[$pos];
        (@arr[$pos], $item) = ($item, @arr[$pos]);
        $writes++;
        while $pos != $cycle-start {
            $pos = $cycle-start;
            for $cycle-start + 1 ..^ $n -> $i {
                $pos++ if @arr[$i] < $item;
            }
            $pos++ while $item == @arr[$pos];
            (@arr[$pos], $item) = ($item, @arr[$pos]);
            $writes++;
        }
    }
    $writes;
}

my @arr = (5, 4, 3, 2, 1);
cycle-sort(@arr);
say @arr;
