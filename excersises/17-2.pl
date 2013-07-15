#! /usr/bin/perl

use 5.010;

print "Choose a directory you want to see: \n";

chomp (my $dir = <STDIN>);

chdir $dir or die "Can't locate $dir: $!\n";

#my @all_files = <*>;
foreach my $file (<*>){
	#my @info = my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat ($_);
	my ($atime, $mtime) = map {
		my ($year, $month, $day ) = (localtime($_))[5,4,3];
		$year += 1900;
		$month += 1;
		sprintf '%4d-%02d-%02d', $year, $month, $day;
	}(stat $file)[8,9];
	printf "%-20s %10s %10s\n", $file, $atime, $mtime;
	#my @times = @info[8,9];
	#unshift @times, $_;
	#print "@times.\n";
	#printf "%-20s %10d %10d\n",@times;

}