#!/usr/bin/perl -w 
use 5.010;

print "Please input a number from 1 to 100.\n";
my $Debug = $ENV{DEBUG} || 1;
my $number = int(1 + rand 100);
print "(Don't tell anyone but the number is $number.)\n" if $Debug;
while(1){                                            #无限循环
	chomp(my $_ = <STDIN>);
	if ($_ =~ /quit|exit|\A\s*\z/i){print "Sorry you gave up. The number is $number.\n";last;}
	elsif ($_ eq $number){print "yes! You get the right number!!\n";last;}
	elsif ($_ lt $number){print "Too low.\n";}
	elsif ($_ gt $number){print "Too big.\n";}
}
