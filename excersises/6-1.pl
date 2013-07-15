#! /usr/bin/perl 

print "please choose a name from below: \nfred barney wilma\n";

chomp (my $name = <STDIN>);

my %last_name = (
	fred => 'flintstone',
	barney => 'rubble',
	wilma => 'jacky',
);
if (exists $last_name{$name}){
	print "$name is $last_name{$name}.\n";
}

else {
	print "this name is not in my hash.\n";
}
