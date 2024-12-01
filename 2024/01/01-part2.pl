#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/01.txt";

my @a;
my @col1;
my @col2;
my $sumsim = 0;

open( my $fh, '<', $fn );

while ( my $s = readline($fh) ) {
    chomp($s);
    my @aa = ( split '\s+', $s );
    push @col1, $aa[0];
    push @col2, $aa[1];

}
close $fh;

for ( my $i = 0 ; $i <= $#col1 ; $i++ ) {

    my $j   = $col1[$i];
    my $sim = grep { $j == $_ } @col2;
    $sumsim += $j * $sim;

}

print "$sumsim\n";

