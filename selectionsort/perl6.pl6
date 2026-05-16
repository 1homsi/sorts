sub selection-sort(@arr is copy) {
    my $n = @arr.elems;
    for 0 ..^ $n -> $i {
        my $min-idx = $i;
        for $i+1 ..^ $n -> $j {
            $min-idx = $j if @arr[$j] < @arr[$min-idx];
        }
        (@arr[$i], @arr[$min-idx]) = (@arr[$min-idx], @arr[$i]);
    }
    @arr
}
say selection-sort([5, 3, 1, 4, 2]).join(", ");
