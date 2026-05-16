sub quicksort(@arr) {
    return @arr if @arr.elems <= 1;
    my $pivot = @arr[@arr.elems div 2];
    my @left = @arr.grep({ $_ < $pivot });
    my @middle = @arr.grep({ $_ == $pivot });
    my @right = @arr.grep({ $_ > $pivot });
    return (quicksort(@left), @middle, quicksort(@right)).flat;
}

say quicksort([3, 6, 8, 10, 1, 2, 1]);
