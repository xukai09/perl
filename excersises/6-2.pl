#! /usr/bin/perl/

#use strict;
#my (@names, %count, $name);
chomp (my @names = <STDIN>);

foreach $name (@names){
	$count{$name} += 1;
}

foreach $name ( sort keys %count){
	print "$name was seen $count{$name} times.\n";
}
