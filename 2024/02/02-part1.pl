#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/02.txt";

my @reports;
my $safe   = 0;
my $unsafe = 0;
my $sump2  = 0;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);

    my $high = 0;
    my $low = 0;
    my $bad = 0;

    my @a = split( / /, $s );

    for ( 1 .. $#a ) {

        my $i = $_;

        if   ( $a[$i] - $a[ $i - 1 ] > 0 ) { 
            $high++; 
        } else { 
            $low++; 
        }

        if (   abs( $a[$i] - $a[ $i - 1 ] ) == 0
            || abs( $a[$i] - $a[ $i - 1 ] ) > 3 )
        {
            $bad++;
        }

    }

    if ( ( ( $high == $#a && $low == 0 ) || ( $low == $#a && $high == 0 ) )
        && $bad == 0 )
    {
        $safe++;
    } 
}
close($fh);

print "part 1: $safe\n";

