#!/usr/bin/perl
# This is a standard word search and has been solved: 
#
# https://www.neilb.org/2020/09/03/wordsearch.html
#
# solve-wordsearch - search for words (from a word list) in a wordsearch grid
#
use strict;
use warnings;
use v5.20;
use feature       qw/ signatures /;
no warnings       qw/ experimental::signatures /;
use File::Slurper qw/ read_lines /;


my @grid      = map { [split('',$_)] } read_lines('../data/04.txt');

my %is_a_word;

$is_a_word{'XMAS'} = 1;

my $num_cols  = int(@{ $grid[0] });
my $num_rows  = int(@grid);
my %found;
my $total = 0;
scan_grid_for_words();
print_words();

sub scan_grid_for_words {
    for (my $row = 0; $row < $num_rows; ++$row) {
        for (my $col = 0; $col < $num_cols; ++$col) {
            foreach my $row_delta (-1, 0, 1) {
                foreach my $col_delta (-1, 0, 1) {
                    next if $row_delta == 0 && $col_delta == 0;
                    scan_line_for_words($row, $col, $row_delta, $col_delta);
                }
            }
        }
    }
}

sub scan_line_for_words ($row, $col, $row_delta, $col_delta) {
    my $word = "";

    while (on_grid($row,$col)) {
        $word .= $grid[$row][$col];
        $found{$word}++ if $is_a_word{$word};
        $row += $row_delta;
        $col += $col_delta;
    }
}

sub on_grid ($row, $col) {
    return ($row < $num_rows && $row >= 0 && $col >= 0 && $col < $num_cols);
}

sub print_words {
    print $found{XMAS};
}
