#!/usr/bin/perl

while(<>){
	chomp;
	if (/(?<word>\b\w*a\b)(?<after>.{0,5})/){
		print "Matched: |$`<$&>$'|\n";
		print "'word' contains $+{word}.\n";
		print "'after' is $+{after}.\n";
	}else {
		print "No match: |$_|\n";
	}
}
