#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/01.txt";

my @col1;
my @col2;
my $sumsim = 0;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);
    my @a = ( split '\s+', $s );
    push @col1, $a[0];
    push @col2, $a[1];

}

close $fh;

for ( my $i = 0 ; $i <= $#col1 ; $i++ ) {

    my $j   = $col1[$i];
    my $sim = grep { $j == $_ } @col2;
    $sumsim += $j * $sim;

}

print "$sumsim\n";

