#! /usr/bin/perl

use 5.010;

print "Please input a directory in your computer: ";

chomp(my $dir = <STDIN>);

chdir $dir or die "cannot find $dir: $!\n";

my @all_files = <*>;

=pod
for(@all_files){
	when (-r $_) {print "$_ is readable!\n";continue}
	when (-w $_) {print "$_ is writerable!\n";continue}
	when (-x $_) {print "$_ is executable\n"}
	default {print "$_ is not readable, writerable, and executable at all!\n"}
}
=cut 

for(@all_files){
	say "Processing $_";

	when (-r $_) {say "\t readable!";continue}
	when (-w $_) {say "\t writerable!";continue}
	when (-x $_) {say "\t executable!"}
}