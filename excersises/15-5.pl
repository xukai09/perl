#! /usr/bin/perl

use 5.010;


print "Checking the number <$ARGV[0]>.\n";

my $favor = $ARGV[1];

given ($ARGV[0]){
	when (! /\A\d+\z/) {say "Not a number!"}

	my @divisors = divisors($_);
	#my $even = 2;

	my @empty;
	when (! (@divisors ~~ @empty)) {print "$_ is not a prime! ";continue}
	when (@divisors ~~ @empty) {print "$_ is a prime! ";continue}
	when (2 ~~ @divisors) {print "And it is an even. ";continue}
	when (! (2 ~~ @divisors)) {print "And it is an ood. ";continue}
	when ($favor ~~ @divisors) {print "It can be divided by $favor.\nReport Over!\n"}
	when (! ($favor ~~ @divisors)) {print "It cannot be divided by $favor.\nReport Over!\n"}
	
}

sub divisors {
	my $number = shift;

	my @divisors = ();
	foreach my $divisor (2..($number/2)) {
		push @divisors, $divisor unless $number % $divisor;	
	}
	return @divisors;
}

