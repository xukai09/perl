#! /usr/bin/perl
# by XuKai@ Apr 8, 2013
# A simple script of spliting and getting gene list from a -m 8 BLAST result

use strict;

my $infile = shift;
my $out = $infile.".out";
my $usage = "ERROR::Please put an infile of -m 8 BLAST result.\n";
die $usage unless $infile;

open IN, "<$infile";
open OUT, ">$out";

my $tag = 1;
	##give an initial $tag value to compare
while (<IN>) {
	chomp;	
	my @lines = split;
	my $first = $lines[0];
	my $second = $lines[1];
	next if $first eq $tag;
	print OUT $first."\t".$second."\n";
	$tag = $first;
}