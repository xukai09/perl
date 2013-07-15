use strict;

use Bio::SearchIO; 
use Bio::AlignIO;
my @all;
my $in = new Bio::SearchIO(-format => 'blast', 
                           -file   => 'LP1G_NODE_1.bla');
while( my $result = $in->next_result ) {
  ## $result is a Bio::Search::Result::ResultI compliant object
  while( my $hit = $result->next_hit ) {
    ## $hit is a Bio::Search::Hit::HitI compliant object
    while( my $hsp = $hit->next_hsp ) {
      ## $hsp is a Bio::Search::HSP::HSPI compliant object
      if( $hsp->length('total') > 50 ) {
        if ( $hsp->percent_identity >= 75 ) {
		my $aln = $hsp->get_aln;
		#push @all, $aln;
		

		for my $seq($aln->each_seq){
			my $name=$seq->display_name;
			my ($start,$end,$strand);
			if($seq->strand==1){
				$start=$seq->start;
				$end=$seq->end;
				$strand="(+)";
				$aln->displayname($name."/".$start."-".$end,$name.$strand."/".$start."-".$end);
			}
			else{
				$start=$seq->end;
				$end=$seq->start;
				$strand="(-)";
				$aln->displayname($name."/".$start."-".$end,$name.$strand."/".$end."-".$start);
			}
				
			
			
			
			
		}

		push @all, $aln;
          
        }
      }
    }  
  }
}


my $alnIO = Bio::AlignIO->new(-format =>"clustalw", -file => ">LP1G_NODE_1.aln");
$alnIO->write_aln(@all);
