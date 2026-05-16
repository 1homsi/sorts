use strict;
use warnings;

sub counting_sort {
    my ($arr, $exp) = @_;
    my $n = scalar @$arr;
    my @output = (0) x $n;
    my @count = (0) x 10;
    for my $x (@$arr) { $count[int($x / $exp) % 10]++ }
    for my $i (1..9) { $count[$i] += $count[$i-1] }
    for my $i (reverse 0..$n-1) {
        my $idx = int($arr->[$i] / $exp) % 10;
        $output[--$count[$idx]] = $arr->[$i];
    }
    @$arr = @output;
}

sub radix_sort {
    my ($arr) = @_;
    return unless @$arr;
    my $max = (sort { $b <=> $a } @$arr)[0];
    my $exp = 1;
    while (int($max / $exp) > 0) {
        counting_sort($arr, $exp);
        $exp *= 10;
    }
}

my @arr = (170, 45, 75, 90, 802, 24, 2, 66);
radix_sort(\@arr);
print join(", ", @arr), "\n";
