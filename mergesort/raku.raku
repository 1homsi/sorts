sub merge(@left, @right) {
    my @result;
    my ($i, $j) = (0, 0);
    while $i < @left.elems && $j < @right.elems {
        if @left[$i] <= @right[$j] {
            @result.push(@left[$i++]);
        } else {
            @result.push(@right[$j++]);
        }
    }
    @result.push(@left[$i..*]) if $i < @left.elems;
    @result.push(@right[$j..*]) if $j < @right.elems;
    @result;
}

sub merge-sort(@arr) {
    return @arr if @arr.elems <= 1;
    my $mid = @arr.elems div 2;
    my @left = merge-sort(@arr[0..$mid-1]);
    my @right = merge-sort(@arr[$mid..*]);
    merge(@left, @right);
}

my @arr = 38, 27, 43, 3, 9, 82, 10;
say merge-sort(@arr);
