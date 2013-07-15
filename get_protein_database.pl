#! /usr/bin/perl
# Function: get all translations from a genbank file
# By XuKai @ May 29, 2013

use strict;
use Bio::SeqIO;
use Bio::Seq;

# useage: perl get_protein_database.pl genbank_file

my $infile = shift;
my $outfile = ${[split /\./,$infile]}[0].".protein.database";
open OUT,">".$outfile;


my $translation;
my $locus_tag;

my $seqio=Bio::SeqIO->new(-file=>$infile,
							-format=>'genbank');

while(my $seq=$seqio->next_seq){
	for my $feat ($seq->get_SeqFeatures) {
		next if($feat->primary_tag eq 'source');
		next if($feat->primary_tag eq 'gene');
		next if($feat->primary_tag eq 'rRNA');
		next if($feat->primary_tag eq 'tRNA');

		$translation = ${[$feat->get_tag_values('translation')]}[0];
		$locus_tag = ${[$feat->get_tag_values('locus_tag')]}[0];		
		
		print OUT ">".$locus_tag."\n";
		print OUT $translation."\n";		
	}
}
close OUT;


