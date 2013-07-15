#! /usr/bin/perl
# Function: Parsing a genbank file. Getting a protein and its gene sequence according to the locus_tag
# By XuKai @ May 29, 2013

use strict;
use Bio::Seq;
use Bio::SeqIO;
use 5.010;

# useage: perl pareseGenBank.pl genbank_file locus_tag

my $infile = shift;
my $bsph = shift;
my $outfile1 = ${[split /\./,$infile]}[0]."_".$bsph.".pep";
open OUT1, ">$outfile1" or die;
my $outfile2 = ${[split /\./,$infile]}[0]."_".$bsph.".seq";
open OUT2, ">$outfile2" or die;

my $tag;
my $translation;
my $seqs;

my $seqio = Bio::SeqIO->new(-file=>$infile,
							-format=>'genbank');

while(my $seq = $seqio->next_seq){
	for my $feat ($seq->get_SeqFeatures){
		next if($feat->primary_tag eq 'source');
		next if($feat->primary_tag eq 'gene');

		if ($feat->has_tag('locus_tag')){
			$tag = ${[$feat->get_tag_values('locus_tag')]}[0];
			if ($tag eq $bsph){
				$translation = ${[$feat->get_tag_values('translation')]}[0];
				$seqs = $feat->seq->seq;
			}
		}
	}
	print OUT1 ">".$bsph."\n";
	print OUT1 $translation."\n";
	print OUT2 ">".$bsph."\n";
	print OUT2 $seqs."\n";
}
close OUT1;
close OUT2;