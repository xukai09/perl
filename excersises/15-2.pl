#! /usr/bin/perl

use 5.010;

for (1..105){
	my $what = '';
	given ($_) {
		when (not $_ % 3) {$what .= ' 3X'; continue}
		when (not $_ % 5) {$what .= ' 5X'; continue}
		when (not $_ % 7) {$what .= ' 7X'}
	}
	print "$_$what.\n";
}
