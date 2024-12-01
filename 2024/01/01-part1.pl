#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/01.txt";

#my @a;
my @col1;
my @col2;
my $gap = 0;

open( my $fh, '<', $fn );

while ( my $s = readline($fh) ) {

    chomp($s);
    my @aa = ( split '\s+', $s );
    push @col1, $aa[0];
    push @col2, $aa[1];

}

close $fh;

@col1 = sort { $a <=> $b } @col1;

@col2 = sort { $a <=> $b } @col2;

for ( my $i = 0 ; $i <= $#col1 ; $i++ ) {

    $gap += abs( $col1[$i] - $col2[$i] );

}

print "$gap\n";

