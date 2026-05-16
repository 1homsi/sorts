sub quicksort {
    my @arr = @_;
    return @arr if @arr <= 1;
    my $pivot = $arr[int(@arr / 2)];
    my @left = grep { $_ < $pivot } @arr;
    my @mid = grep { $_ == $pivot } @arr;
    my @right = grep { $_ > $pivot } @arr;
    return (quicksort(@left), @mid, quicksort(@right));
}

my @sorted = quicksort(3, 6, 8, 10, 1, 2, 1);
print join(" ", @sorted), "\n";
