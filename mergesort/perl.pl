#!/usr/bin/perl
#Why should this exist?
#please help me

use strict;
use warnings;


sub merge_sort {
    my @arr = @_;

    return @arr if @arr < 2;

    my $p = int @arr / 2;
    my @m1 = merge_sort(@arr[0 .. $p - 1]);
    my @m2 = merge_sort(@arr[$p .. $#arr]);
    
    for (@arr) {
        $_ =
        !@m1 ? shift @m2 : 
        !@m2 ? shift @m1 :
        $m1[0] <= $m2[0] ? shift @m1 : 
        shift @m2;
    }
    @arr;
}

my @arr = (5,9,1,3,4,6,6,3,2);
@arr = merge_sort(@arr);
print "@arr\n";
