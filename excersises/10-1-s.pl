#! /usr/bin/perl
# Chapter 10 exercise 1
# by XuKai

use 5.010;

print "Please input an number between 1 and 100:\n\n";
my $number = int(1+rand 100);

while (1){	
	#print "Notice: number must be 1~100!\n\n";	
	chomp (my $input = <STDIN>);
		last if $input=~/quit|exit|\A\s*\z/i;
		#redo if $input < 1 or $input > 100;
		if ($input == $number){
			print "You got the right number!!\n";
			last;
		}
		elsif($input > $number){
			print "Too hight!\n";
			}
		elsif($input < $number){
			print "Too low!\n";
		}	
}