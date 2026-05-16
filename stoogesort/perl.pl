use strict;
use warnings;

sub stooge_sort {
    my ($arr, $first, $last) = @_;
    if ($arr->[$first] > $arr->[$last]) {
        ($arr->[$first], $arr->[$last]) = ($arr->[$last], $arr->[$first]);
    }
    if ($last - $first + 1 > 2) {
        my $t = int(($last - $first + 1) * 2 / 3);
        stooge_sort($arr, $first, $first + $t - 1);
        stooge_sort($arr, $last - $t + 1, $last);
        stooge_sort($arr, $first, $first + $t - 1);
    }
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6);
stooge_sort(\@arr, 0, $#arr);
print join(" ", @arr) . "\n";
