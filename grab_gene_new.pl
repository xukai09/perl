use Bio::SeqIO;

sub trim($);
sub ltrim($);
sub rtrim($);

$gb_file = $ARGV[0]; 
$gene_name = trim($ARGV[1]);


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
				if(trim($val) eq $gene_name)
				{
        			print ">",$val,"|";
					my $location = $feat_object->location();
					printf( "%s|%d|%d-%s|\n", 
							$location->seq_id, $location->start, $location->end, $location->strand);					
					#print "location str is ", $location->to_FTstring(), "\n";
					print $feat_object->seq()->seq(), "\n";
				}
        # e.g. 'NDP', from a line like '/gene="NDP"'
      }
    }
  }
}



# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}
# Left trim function to remove leading whitespace
sub ltrim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	return $string;
}
# Right trim function to remove trailing whitespace
sub rtrim($)
{
	my $string = shift;
	$string =~ s/\s+$//;
	return $string;
}
