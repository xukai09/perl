#! /usr/bin/perl

use 5.010001;

my $secret = int(1 + rand 100);

print "Please input a number: ";


while(1){
given($secret){
	chomp(my $_ = <STDIN>);
	when (! /\A[0-9]+\z/) {say "you have to put an number!";last}
	when ($secret > $_) {say "too low."}
	when ($secret < $_) {say "too high."}
	when ($secret == $_) {say "you got the right number!";last}
	}
}