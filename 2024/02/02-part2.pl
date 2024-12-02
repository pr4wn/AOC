#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/02.txt";

my $safe   = 0;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);

    my $inc = 0;
    my $dec = 0;
    my $err = 0;

    my @a = split( / /, $s );

    for ( 1 .. $#a ) {

        my $i = $_;

        if   ( $a[$i] - $a[ $i - 1 ] > 0 ) { 
            $inc++; 
        } else { 
            $dec++; 
        }

        if (   abs( $a[$i] - $a[ $i - 1 ] ) == 0
            || abs( $a[$i] - $a[ $i - 1 ] ) > 3 )
        {
            $err++;
        }

    }

    if ( ( ( $inc == $#a && $dec == 0 ) || ( $dec == $#a && $inc == 0 ) )
        && $err == 0 )
    {
        $safe++;
    } elsif ( ( ( $inc == $#a && $dec == 0 ) || ( $dec == $#a && $inc == 0 ) )
        && $err == 1 )
    {
        $safe++;
    } elsif (
        (
            ( $inc == $#a - 1 && $dec == 1 ) || ( $dec == $#a - 1 && $inc == 1 )
        )
        && $err == 0
      )
    {
        $safe++;
    }

}

close($fh);

print "part 2: $safe\n";

