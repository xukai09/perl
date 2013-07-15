#! /usr/bin/perl -w 
# Function: Read a fasta file and get the seqs from a start and an end position
# By XuKai @ May 30, 2013

use strict;
use 5.010;
use Bio::SeqIO;
use Bio::Seq;

#useage: perl retrieving_sequences.pl file.fasta start end

my $useage = <<"EOS";
To retrieving a sequence from a fasta file by giving the start and end position.
	useage: perl retrieving_sequences_from_fasta.pl start end fasta_file
	eg. perl retrieving_sequences_from_fasta 344 9878 c3-41,fasta\n	
EOS


my $infile = shift;
my $start = shift;
my $end = shift;

die $useage unless $infile;
die $useage unless $start;
die $useage unless $end;

my $outfile = ${[split /\./, $infile]}[0]."_".$start."_".$end;

open OUT, ">$outfile";

my $seqio = Bio::SeqIO->new(-file=>$infile, -format=>'fasta');

while(my $seq = $seqio->next_seq){
	my $string = $seq->subseq($start,$end);
	#print $seq->seq."\n";
	print OUT $string."\n";
}
close OUT;