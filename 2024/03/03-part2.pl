#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/03.txt";

my @matches;
my $total = 0;
my $go    = 1;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);

    while ( $s =~ m/(do(n't)?\(\)|mul\(\d{1,3},\d{1,3}\))/g ) {

        if ( $1 eq "do()" ) {

            $go = 1;

        } elsif ( $1 eq "don't()" ) {

            $go = 0;

        } elsif ($go) {

            $1 =~ m/(\d+),(\d+)/;
            $total += $1 * $2;

        }

    }

}

print "Total: $total\n";

