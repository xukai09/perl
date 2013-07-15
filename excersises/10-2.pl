#!/usr/bin/perl

$ENV{ZERO}  = 0;
$ENV{EMPTY} = '';
$ENV{UNDFINED} = undef;

my $longest = 0;

open OUT , ">OUT_of_ENV_new";
foreach my $key (keys %ENV){
	my $key_length = length($key);
	$longest = $key_length if $key_length > $longest;
}

foreach my $key (sort keys %ENV){
	printf OUT "%-${longest}s %s\n",$key,defined $ENV{$key} ? $ENV{$key} : "(undefined)"; 
}
close OUT;
