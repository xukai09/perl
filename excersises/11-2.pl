#!/usr/bin/perl -w

use DateTime;
use Time::Piece;

my $dt = localtime;
my $dt1 = DateTime->new(
		year  => $dt->year,
		month  => $dt->month,
		day  => $dt->day,
	);


my $dt2 = DateTime->new(
		year  => $ARGV[0],
		month  => $ARGV[1],
		day  => $ARGV[2],
	);
my $duration = $dt1 - $dt2;
my @units = $duration->in_units(qw(years months days));
printf "%d years, %d months, and %d days\n",@units;
