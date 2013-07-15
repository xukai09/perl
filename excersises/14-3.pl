#! /usr/bin/perl

use 5.010;
use strict;


=pod
#my $input = shift @ARGV;
print "Please input a string, and a substring, with a ? to split: \n";
chomp(my $string = <STDIN>);

my @strings = split /\?/, $string;
my $input = $strings[0];
my $substring = $strings[1];

my $begin;


unless ($input =~ /($substring)/) {
	print "Sorry, does'nt match!!!\n\n";
}

else {
	my $where = index ($input, $substring);
	for ($begin = 0;defined $where;$begin += ($where+1)) {
		
		my $where = index($input, $substring, $where+1);
		last if $where == -1;
		print "One position is $where.\n";
	}
}
=cut

print "Please enter a string: ";
chomp(my $string = <STDIN>);
print "Please enter a substring: ";
chomp(my $substring = <STDIN>);

my @places;

unless ($string =~ /($substring)/) {
	print "Sorry, does'nt match at all!\n";
}

for (my $pos = -1; ; ) {
	$pos = index($string, $substring, $pos +1);
	last if $pos == -1;
	#push @places, $pos;
	print "One location of '$substring' in '$string' is: $pos.\n";
}

#print "Locations of $substring in $string were: @places.\n\n";