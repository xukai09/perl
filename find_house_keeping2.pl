#! /usr/bin/perl
# Funciton: To find a specified gene (usually a house-keeping gene like dnaA) in a series of genomes.
# Modified by XuKai @ Jun 5, 2013
# Email: xukai0915@gmail.com
# Version 1.1

use strict;
use Bio::SeqIO;
use Getopt::Long;

my $useage = <<"EOS";
To find a specified gene (usually a house-keeping gene like dnaA) in a series of genomes.
	useage: perl find_house_keeping.pl	[options]
	eg. perl find_house_keeping.pl -f ~/Desktop/genomes/ -g dnaA\n
Options:
	-f 		folder which contains a series of genomes.
	-g 		specified house-keeping gene you want to get.
	-v 		get the version information.
	-h 		This help message.\n
EOS

my $version = "find_house_keeping_gene.pl. Version 1.1\n\n";
my ($folder,$gene);

GetOptions(
	"f=s"	=>	\$folder,
	"g=s"	=>	\$gene,
	"v" 	=> 	sub{die $version},
	"h"		=>	sub{die $useage},	
);

die $useage unless $folder;
die $useage unless $gene;

chdir $folder or die "Can't chdir to $folder: $!";
my @all_files = glob '*';
my $number = 0;

foreach my $file (@all_files)
{
	print "Reading file $file...\n";
	grab_gene_new($file,$gene);
	$number++;
}

print "Finished. Totally $number files.\n";

sub grab_gene_new
{
	my ($gb_file,$gene_name) = @_; 
	my $seqio_object = Bio::SeqIO->new(-file => $gb_file);
	my $seq_object = $seqio_object->next_seq;
 
	for my $feat_object ($seq_object->get_SeqFeatures) 
	{
		if ($feat_object->primary_tag eq "CDS") 
		{
    	if ($feat_object->has_tag('gene')) 
			{
	    	for my $val ($feat_object->get_tag_values('gene'))
				{
					if($val eq $gene_name)
					{
        				print ">",$val,"|";
						my $location = $feat_object->location();
						printf( "%s|%d|%d-%s|\n",$location->seq_id, $location->start, $location->end, $location->strand);					
						print $feat_object->seq()->seq(), "\n";
					}
      			}	
    		}
  		}
	}
}