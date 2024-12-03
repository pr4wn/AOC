#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/03.txt";

my @matches;
my $total = 0;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);

    my @matches = $s =~ m/mul\((\d{1,3}),(\d{1,3})\)/g;

    for ( my $i = 0 ; $i <= $#matches ; $i += 2 ) {

        $total += $matches[$i] * $matches[ $i + 1 ];

    }

}

close $fh;

print "Total: $total\n";
