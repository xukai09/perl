#! /usr/bin/perl

use 5.010;
use strict;

print "Please input an directory:\n";
chomp(my $directory = <STDIN>);
my @all_files;

sub case_insensitive {"\L$a" cmp "\L$b"};  ##忽略大小写的比较（20、36行）

if ($directory =~ /\A\s*\z/) {
	chdir;
	print "You've chosen the home folder, and list below: \n################################################\n";
	opendir DIR, "/home/xukai";
	foreach my $file (readdir DIR){
		##print $file."\n";
		push @all_files, $file;
	}
	my @all_files = sort case_insensitive @all_files;
	foreach my $file (@all_files){
		next if $file =~ /\A\./;
		print $file."\n";
	}

	closedir DIR;
}
else {
	chdir $directory or die "can not chdir to $directory: $!\n";
	print "You've chosen the folder $directory, and list below:  \n################################################\n";
	opendir DIR, $directory or die "can't open $directory: $!\n";
	foreach my $file (readdir DIR){
		#print $file."\n";
		push @all_files, $file;
	}
	my @all_files = sort case_insensitive @all_files;
	foreach my $file (@all_files){
		next if $file =~ /\A\./;
		print $file."\n";
	}
	closedir DIR;
}

#my @all_files = glob '.* *';
#my @all_files = glob '*';		## filename glob
#my @all_files = sort @all_files;
#foreach my $file (@all_files){
#	print $file."\n";
#}


