#! /usr/bin/perl

use 5.010;
use strict;

my %last_name = qw{fred flintstone Wilma Flintstone	Barney Rubble betty rubble Bamm-Bamm Rubble	PEBBLES FLINTSTONE};

sub by_name {
	"\L$last_name{$a}" cmp "\L$last_name{$b}"
		or
	"\L$a" cmp "\L$b"
}

my @names = sort by_name keys %last_name;

foreach (@names){
	#my $key = keys %last_name;
	print $_." ".$last_name{$_}."\n";
}


#print "Names are:@names.\n";