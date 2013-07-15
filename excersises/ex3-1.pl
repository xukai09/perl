#!/usr/bin/perl

print "please input your array:\n";
chomp(@lines = <STDIN>);
print "\nyour array is:\n@lines\n";
chomp(@re = reverse @lines);
print "reverse list is:\n@re\n";
