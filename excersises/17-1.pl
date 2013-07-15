#! /usr/bin/perl

use 5.010;

my $filename = '/home/xukai/test.pl';

open FH, "<$filename" or die "Can't open '$filename': $!";

chomp(my @strings = <FH>);
while(1){
	print "Please enter a pattern: ";
	chomp(my $pattern = <STDIN>);
	last if $pattern =~ /\A\s+\Z/;
	my @matchs = eval{
		grep /$pattern/, @strings;
	};
	if ($@){
		print "Error: $@";
	}else {
		my $count = @matchs;
		print "There were $count matching strings: \n",
			map "$_\n",@matchs;
	}
	print "\n";
}