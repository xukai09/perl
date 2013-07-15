#! /usr/bin/perl
# Function: this script is used to get a sequence's reverse complement
# Author: XuKai @Jun 6, 2013

use strict;
use Bio::Seq;
use Bio::SeqIO;

my $infile = shift;
my $outfile = $infile.".reverse_complement";
my $useage = <<"EOS";
This script is used to get a sequence's reverse complement.
	Useage: perl get_reverse_complement.pl file.fasta	
EOS
open OUT, ">$outfile";

die $useage unless $infile;

my $seqio_obj = Bio::SeqIO->new(-file=>$infile, -format=>'fasta');

while (my $seq_obj = $seqio_obj->next_seq){
	#my $reverse_obj = $seq_obj->revcom;
	my $reverse_seq = $seq_obj->revcom->seq;
	my $id = $seq_obj->display_id;
	print OUT ">".$id."\n";
	print OUT $reverse_seq."\n";
}
close OUT;