#! /usr/bin/perl

use 5.010;

##my own code
=pod 
sub divisors {
	my $number = shift;

	my @divisors = ();
	foreach my $divisor (2..($number/2)) {
		push @divisors, $divisor unless $number % $divisor;
		#if ($number % $divisor == 0){push @divisors, $divisor;}
		
	}#print "@divisors.\n";
	return @divisors;
}
my $in = shift @ARGV;
my @all = &divisors($in);
push @all, $in;
unshift @all, 1;
my @self = (1,$in);

LOOP:{
	unless($in ~~ /\A\d+\z/) {print "Error! you have to put an number!\n";last LOOP}
	given(@all){
	when (@all ~~ @self) {print "Sorry, the number $in is a prime!\n"}
	when (@all > @self) {shift @all, pop @all, print "The divisors of the number $in is @all.\n"}
	}
}
=cut


##the key code

print "Checking the number <$ARGV[0]>.\n";

given ($ARGV[0]){
	when (! /\A\d+\z/) {say "Not a number!"}

	my @divisors = divisors($_);

	my @empty;
	when (@divisors ~~ @empty) {say "Number is a Prime!"}
	default {say "$_ is divisible by @divisors"}
}

sub divisors {
	my $number = shift;

	my @divisors = ();
	foreach my $divisor (2..($number/2)) {
		push @divisors, $divisor unless $number % $divisor;	
	}
	return @divisors;
}