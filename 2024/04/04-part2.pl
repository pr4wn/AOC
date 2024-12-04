#!/usr/bin/perl
use strict;
use warnings;

my $fn = "../data/04.txt";

my @lines;

my $total = 0;
my $width = 0;

open( my $fh, '<', $fn ) or die "Cannot open file $fn $!";

while ( my $s = readline($fh) ) {

    chomp($s);

    if ( $width == 0 ) {

        $width = length($s);

    }

    push( @lines, $s );

}

for ( my $i = 1 ; $i <= $#lines - 1 ; $i++ ) {

    for ( my $j = 1 ; $j <= $width - 1 ; $j++ ) {

        if ( substr( $lines[$i], $j, 1 ) eq 'A' ) {

            if (
                (
                    (
                           substr( $lines[ $i - 1 ], $j - 1, 1 ) eq 'M'
                        && substr( $lines[ $i + 1 ], $j + 1, 1 ) eq 'S'
                    )
                    || (   substr( $lines[ $i - 1 ], $j - 1, 1 ) eq 'S'
                        && substr( $lines[ $i + 1 ], $j + 1, 1 ) eq 'M' )
                )
                && (
                    (
                           substr( $lines[ $i - 1 ], $j + 1, 1 ) eq 'M'
                        && substr( $lines[ $i + 1 ], $j - 1, 1 ) eq 'S'
                    )
                    || (   substr( $lines[ $i - 1 ], $j + 1, 1 ) eq 'S'
                        && substr( $lines[ $i + 1 ], $j - 1, 1 ) eq 'M' )
                )
              )
            {

                $total++;
            }
        }
    }
}

close $fh;

print "Total: $total\n";
