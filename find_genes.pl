#! /usr/bin/perl
# by xukai @Nov 26 2012

use Bio::Seq;
use Bio::SeqIO;

my $input = shift;

open INPUT, "<$input";

while (<INPUT>){
	my @lines = split;
	$start = $lines[0];
	$end = $lines[1];
	&getgene;
}


sub getgene {
	my $outfile = "C3-41"."_".$start."-"."$end";
	open OUT, ">".$outfile;
	my $seqio = Bio::SeqIO->new(-file=>"C3-41_chromosome.gb",-format=>'genbank');
	while(my $seq = $seqio->next_seq){
		my $acc = $seq->accession_number;
		for my $feat ($seq->get_SeqFeatures){
			next if($feat->primary_tag eq 'source');
			next if($feat->primary_tag eq 'CDS');
			my $s = $feat->location->start;
			my $e = $feat->location->end;
			next if($e<$start || $s>$end);
			my $name = $acc."_";
			if ($feat->has_tag('gene')){
				$name.=${[$feat->get_tag_values('gene')]}[0];
			}
			elsif ($feat->has_tag('locus_tag')){
				$name.=${[$feat->get_tag_values('locus_tag')]}[0];
			}
			else {
				$name.=$feat->primary_tag;			
			}
		$name.="_[".$s."-".$e."]";
		my $seqs = $feat->seq->seq;
		print OUT ">".$name."\n";
		print OUT $seqs."\n";
		}
	}
close OUT;
}
