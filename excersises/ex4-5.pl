#!/usr/bin/perl

use 5.010;

sub greet{
	state @last_person;  #持久数组

	my $name = shift;    #传入参数
 	print "Hi $name!";
	if (@last_person){
		
		print "I'v seen: @last_person\n";
}
	else{
	print "You are the first one here!\n";
}
	push @last_person,$name;   #保存名字至列表
}

greet ("Fred");
greet ("Barney");
greet ("Wilma");
greet ("Betty");
