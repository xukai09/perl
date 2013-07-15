#! /usr/bin/perl
# Creat a Venn Chart by this script. Look into http://search.cpan.org/~djibel/Venn-Chart-1.02/lib/Venn/Chart.pm
# tried on May 8, 2013

use warnings;
use Carp;
use strict;

use Venn::Chart;

#Creat the Venn::Chart constructor
my $venn_chart = Venn::Chart->new(600,600) or die ("error: $!");

#Set a title and a legend for our chart 
$venn_chart->set_options( -title => 'Venn diagram');
$venn_chart->set_legends( 'Team 1', 'Team 2', 'Team 3');

#3 lists for the Venn diagram
my @team1 = qw/abel edward momo albert jack julien chris/;
my @team2 = qw/edward isabel antonio delta albert kevin jake/;
my @team3 = qw/gerald jake kevin lucia john edward/;

#Creat a diagram with gd object
my $gd_venn = $venn_chart->plot(\@team1, \@team2, \@team3);

#Creat a Venn diagram image in png, gif and jepg format
open my $fh_venn, '>', 'Venn-Chart-1.png' or die ("Unable to creat png file\n");
binmode $fh_venn;
print {$fh_venn} $gd_venn->png;
close $fh_venn or die ("Unable to close file");

#Creat a histogram image of Venn diagram (png, gif and jepg format)
my $gd_histogram = $venn_chart->plot_histogram;
open my $fh_histo, '>', 'VennHistogram.png' or die ("Unable to creat png file\n");
binmode $fh_histo;
print {$fh_histo} $gd_histogram->png;
close $fh_histo or die ("Unable to close file");

#Get data list for each intersection or unique region between the 3 lists
my @ref_lists = $venn_chart->get_list_regions();
my $list_number = 1;
foreach my $ref_region (@ref_lists){
	print "List $list_number : @{ $ref_region }\n";
	$list_number++;
}