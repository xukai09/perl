#!/usr/bin/perl -w

my $input = shift @ARGV;
my $output = shift @ARGV;

open INPUT, "<$input";
open OUT, ">$output";

while (<INPUT>){
	s/Bsph/Larry/gis;
	s/NC/KKK/gis;
	print OUT $_;	
}
close OUT;
