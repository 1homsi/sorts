use strict;
use warnings;

sub cycle_sort {
    my @arr = @_;
    my $n = scalar @arr;
    my $writes = 0;
    for my $cycle_start (0 .. $n - 2) {
        my $item = $arr[$cycle_start];
        my $pos = $cycle_start;
        for my $i ($cycle_start + 1 .. $n - 1) {
            $pos++ if $arr[$i] < $item;
        }
        next if $pos == $cycle_start;
        $pos++ while $item == $arr[$pos];
        ($arr[$pos], $item) = ($item, $arr[$pos]);
        $writes++;
        while ($pos != $cycle_start) {
            $pos = $cycle_start;
            for my $i ($cycle_start + 1 .. $n - 1) {
                $pos++ if $arr[$i] < $item;
            }
            $pos++ while $item == $arr[$pos];
            ($arr[$pos], $item) = ($item, $arr[$pos]);
            $writes++;
        }
    }
    return @arr;
}

my @arr = (5, 4, 3, 2, 1);
@arr = cycle_sort(@arr);
print join(" ", @arr) . "\n";
