#!/usr/bin/perl

@names = qw/ fred betty barney dino wilma pebbles bamm-bamm /;
print "please input your number from 1-7,then Ctronl + D to finish:\n";
chomp(@number=<STDIN>);

foreach (@number){print "$names[$_-1]\n";}
