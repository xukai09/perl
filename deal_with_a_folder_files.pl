#! /usr/bin/perl -w

use strict;
use Bio::SeqIO;


my $folder = shift;
my $gene = shift;
chdir $folder or die "Can't chdir to $folder: $!";

my @all_files = glob '*';

foreach my $file (@all_files)
{
	grab_gene_new($file,$gene);
}


sub grab_gene_new
{
	my ($gb_file,$gene_name) = @_; 

	#print "filename =", $gb_file,"\n";
	#print "gene name = ", $gene_name,"\n";

	#my $seqio_object = Bio::SeqIO->new(-file => "NC_015564.gbk");
	my $seqio_object = Bio::SeqIO->new(-file => $gb_file);
	my $seq_object = $seqio_object->next_seq;
 
	#print "parsing features...\n";

	for my $feat_object ($seq_object->get_SeqFeatures) 
	{
		if ($feat_object->primary_tag eq "CDS") 
		{
		#print $feat_object->spliced_seq->seq,"\n";
    	# e.g. 'ATTATTTTCGCTCGCTTCTCGCGCTTTTTGAGATAAGGTCGCGT...'
    	if ($feat_object->has_tag('gene')) 
			{
	    	for my $val ($feat_object->get_tag_values('gene'))
				{
					if($val eq $gene_name)
					{
        				print ">",$val,"|";
						my $location = $feat_object->location();
						printf( "%s|%d|%d-%s|\n",$location->seq_id, $location->start, $location->end, $location->strand);					
						#print "location str is ", $location->to_FTstring(), "\n";
						print $feat_object->seq()->seq(), "\n";
					}
        				# e.g. 'NDP', from a line like '/gene="NDP"'
      			}	
    		}
  		}
	}
}