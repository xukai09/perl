#!perl -w 
use strict; 
my $indir=shift;
opendir(DIR,$indir)or die "cannot open the dirctory!";
while(my $name=readdir DIR){ 
	next if $name=~/^\./;
	my $filename=$name;
	$filename=~s/(\.\w+)?$//; 
	system("blastall -i $indir/$name -p blastn -d gene_list_1-4639821.fasta -e 1e-2 -o $filename.bla");

	open(BLAST,$filename.".bla");
	open(BRIEF,">".$filename.".brief");
	while(<BLAST>){
	  my $flag=0;
		if(/Sequences producing significant alignments/){
			<BLAST>;
			while(<BLAST>){
				if(/^>/){
					$flag=1;
					last;	
				}
				print BRIEF;
			}
		}
	  last if($flag==1);
	}
		close BRIEF;
		close BLAST;	
 
}
