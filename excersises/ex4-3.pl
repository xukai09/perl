#!/usr/bin/perl

sub total{
	my $sum = 0;
	foreach(@_){
		$sum += $_;	
	}return $sum;
}

sub average {
	if (@_ == 0){return}
	my $count = @_;
	my $sum = total(@_);
	$sum/$count
}

sub above_average {
	my $average = average(@_);
	my @list;
	foreach(@_){
		if ($_ > $average){push @list, $_;}	
	}
	@list;
}
my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(should be 6 7 8 9 10)\n";
my @barney = above_average(100,1..10);
print "\@barney is @barney\n";
print "(should be just 100)\n";
