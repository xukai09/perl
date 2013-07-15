#!/usr/bin/perl -w

my $what = "fred|barney";

chomp (my $_ = <STDIN>);
	if (/($what){3}/)
	{print "it matched!!!\n";
	}
	else {print "Try again!!!\n";}

