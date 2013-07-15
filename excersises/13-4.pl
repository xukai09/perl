#! /usr/bin/perl

use 5.010;
use strict;

=pod
my $file = shift;
unlink $file;
=cut

#unlink @ARGV;

use File::Basename;
use File::Spec;

my ($source, $dest) = @ARGV;

if (-d $dest){
	my $basename = basename $source;
	$dest = File::Spec->catfile($dest, $basename);
}

rename $source, $dest
	or die "can't rename $source to $dest:$!\n";