#! usr/bin/perl -w
#2012.06.26

use strict;
use Bio::SeqIO;

my $list = shift @ARGV;
my $input = shift @ARGV;
my $output = shift @ARGV;

my $in = Bio::SeqIO ->new (-file =>$input, -format => "Genbank");
open OUT, ">$output";
open LIST, "<$list";

my %hash;
for my $feat ($in-> next_seq() ->get_SeqFeatures){

	if ($feat->primary_tag eq "CDS") {
			
		if ($feat -> has_tag('locus_tag') && $feat -> has_tag('product')){

			my $locus_tag = ${[$feat -> get_tag_values('locus_tag')]}[0];
			my $product = ${[$feat -> get_tag_values('product')]}[0];
			$hash{$locus_tag} = $product;

		}
	}
}

while (<LIST>){
	chomp;
	foreach my $key (sort keys %hash){
		if ($key=~/$_/){
			print OUT $key." ".$hash{$key}."\n";
			last;
		}
	}
}

close OUT;
