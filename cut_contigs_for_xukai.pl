#!/usr/bin/perl -w
use strict;

#句柄IN
my $file=shift;
open IN, "<$file";     
                         
my @lines;
my @mz;

#读入第一行，然后存入$line中
my $line=<IN>;
push @mz, $line;


#读入下一行，直接判断下一行中是否有>号
while(<IN>){
	if(/>(.*)/){
		push @lines,$line;
		$line=$_;
		push @mz, $1;
	}
	else{
		$line.=$_;	
	}
}
push @lines,$line;

###jumpjkdjfdjfkdajfd
#打印@lines
my $i =0;
foreach (@lines){                               
	open OUT, ">".$mz[$i++];
	print OUT $_;

	print "reached $i!";

	close OUT;
}

