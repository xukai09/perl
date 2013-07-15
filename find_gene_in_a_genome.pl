#!perl -w
#by wb 2010-09-14

use strict;
use Bio::SeqIO;
use Bio::Seq;

my $infile=shift;
my $start=shift;
my $end=shift;
my $outfile=${[split /\./,$infile]}[0]."_".$start."-".$end;
open OUT,">".$outfile;

my $seqio=Bio::SeqIO->new(-file=>$infile,-format=>'genbank');
while(my $seq=$seqio->next_seq){
	my $acc=$seq->accession_number;
	for my $feat ($seq->get_SeqFeatures) {
		next if($feat->primary_tag eq 'source');
		next if($feat->primary_tag eq 'CDS');
		my $s=$feat->location->start;
		my $e=$feat->location->end;
		next if($e<$start || $s>$end);

		#produce title
		my $name=$acc."_";
		if($feat->has_tag('gene')){
			$name.=${[$feat->get_tag_values('gene')]}[0];
		}
		elsif($feat->has_tag('locus_tag')){
			$name.=${[$feat->get_tag_values('locus_tag')]}[0];
		}
		else{
			$name.=$feat->primary_tag;
		}
		$name.="_[".$s."-".$e."]";

		#fetch sequence
		my $seqs=$feat->seq->seq;

		#output
		print OUT ">".$name."\n";
		print OUT $seqs."\n";
	}
}
close OUT;


