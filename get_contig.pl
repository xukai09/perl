#! /usr/bin/perl
# Function: Get the specific contig sequence from a multi-fasta file
# by Xu Kai @ Jul 1, 2013

use strict;

my $input = shift;
my $node = shift;
my $out = $input.".nodes";

open IN, "<$input";
open OUT, ">>$out";
###Useage: perl get_contig.pl multi_fasta_file NODE_number

my $line;
my @lines;

while (<IN>){
	chomp;
	if (/>(.*)/){
		push @lines, $line;
		$line = $_;
		push @lines, $line;
		#push @lines, $_;
	}
	else{
		$line .= $_;
		
	}
	#push @lines, $line;
}
#push @lines, $line;
shift @lines;
my %contigs = @lines;

foreach (sort keys %contigs){
	if ($_ =~ /$node/){
		#print OUT ">$node\n";
		print OUT $contigs{$_}."\n";
	}
}
