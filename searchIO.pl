use strict;
use Bio::SearchIO; 
use Bio::AlignIO;
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
	  my $squery;
	  my $hquery;
	  if ($hsp->strand('query') == 1){$squery = "(+)";}
	    	else {$squery = "(-)";}
	  if ($hsp->strand('hit') == 1){$hquery = "(+)";}
	    	else {$hquery = "(-)";}
          print "Query=",   $result->query_name,
            " Hit=",        $hit->name,
            " Length=",     $hsp->length('total'),
            " Percent_id=", $hsp->percent_identity, 
	    " strand=","$squery/$hquery","\n";
        }
      }
    }  
  }
}
