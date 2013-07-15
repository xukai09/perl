#! perl -w
use strict;

my $dir=shift;
$dir=~s/\/$//;
opendir(DH,$dir);
foreach my $fn (readdir DH){
   next unless $fn=~/\.tab$/;
   open(FILE,$dir."/".$fn);
   my @index;
   my @line;
   my @column;
   my $i=0;
   while(<FILE>){
	my @l=split /\t/;
	push @column,[$l[6],$l[7]];
        push @index,$i;
        push @line,$_;
        $i++;
   }
   close FILE;

   @index=sort {$column[$a][0]<=>$column[$b][0] or $column[$a][1]<=>$column[$b][1]} @index;
   
   $fn=~/(.*?)(\.tab)/;
   open(OUT,">".$dir."/".$1."_sorted".$2);
   for(@index){
      print OUT $line[$_];
   }
   close OUT;
}
closedir DH;

