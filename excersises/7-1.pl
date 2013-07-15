#!/usr/bin/perl

use 5.010;
while (<>){
	chomp;
	push @lines, $_;
}

foreach (@lines){
	if (/\[/) {say ;}
}
