use Bio::AlignIO;
 
$in  = Bio::AlignIO->new(-file => "2297_NODE_1.blast" ,
                         -format => 'bl2seq');
$out = Bio::AlignIO->new(-file => ">outputfilename",
                         -format => 'clustalw');
 
while ( my $aln = $in->next_aln ) { 
  $out->write_aln($aln); 
}
