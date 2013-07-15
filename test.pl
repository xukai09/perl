#! /usr/bin/perl 
# just for test;
use 5.010001;

=pod
############################################################################################################


my @people = qw/fred barney fred wilma dino barney fred fred pebbles/;
my %count;
$count{$_}++ foreach @people;

print $count{"fred"}."\n";
print $count{"barney"}."\n";		##统计次数

############################################################################################################

foreach(1..10){
	print "Iteration number $_.\n\n";
	print "Please choose: last, next, redo, or none of above?";
	chomp(my $choice = <STDIN>);
	print "\n";
	last if $choice=~/last/i;
	next if $choice=~/next/i;
	redo if $choice=~/redo/i;
	print "That wasn't any of the choices... onward!\n\n";
}

print "That's all, folks!\n";

############################################################################################################

($m < $n)&&($m = $n);
if($m < $n){$m = $n};
($m > 10) || print "why is it not greater?\n";

($m < $n) ? ($m = $x) : ($n = $x); 	##将$x赋值给较小的那个变量

############################################################################################################

open my $fh, "<$filename"
or die "Can't open '$filename':$!";

die "Oops! A file called '$filename' already exist.\n"
	if -e $filename;

############################################################################################################

foreach my $file (glob "*.old"){				##glob can fetch all file list as required
	my $newfile = $file;
	$newfile =~ s/\.old$/.new/;
	if (-e $newfile){
		warn "can't rename $file to $newfile: $newfile exist!\n";
	}elsif (rename $file => $newfile){
						##do nothing
		}else{
			warn "rename $file to $newfile failed: $!\n";
		}
}

############################################################################################################

## soft link
symlink 'dodgson', 'carroll'
	or warn "can't symlink dodgson to carroll: $!\n";

my $where = readlink 'carroll';

my $perl = readlink '/usr/local/bin/perl';

############################################################################################################

my $temp_dir = "/tmp/scratch_$$";
mkdir $temp_dir, 0700 or die "can't creat $temp_dir: $!\n";
...
##
...
unlink glob "$temp_dir/* $temp_dir/.*";				##delete all files in this folder
rmdir $temp_dir;									##we can delete the empty folder now.

############################################################################################################

$where = index($big, $small);


sub by_number {$a <=> $b};
my $result = sort by_number @some_numbers;

sub case_insensitive {"\L$a" cmp "\L$b"};   ##ignore A or a


my @some_numbers = qw/12 9 34 55 11 7 98 65 54 101 22 33 73 43 92 38/;
print "my numbers are: @some_numbers.\n\n";
my @before = sort @some_numbers;
print "as before should be: @before.\n\n";
my @numbers = sort {$a <=> $b} @some_numbers;
print "now numbers are: @numbers.\n\n";

#my @descending = reverse sort {$a <=> $b} @some_numbers;		##equle to next line
my @descending = sort {$b <=> $a} @some_numbers;
print "now we reverse the order: @descending.\n\n";


my %score = (
	barney => 195,
	fred => 205,
	dino => 30,
	wilma => 95,
	jack => 30,
	);
sub by_score {$score{$b} <=> $score{$a} or $a cmp $b};

my @winners = sort by_score keys %score;
print "@winners.\n";


print "Enter a name: ";
my $name = <STDIN>;

say "I found Fred in the name! " if $name ~~ /Fred/i;


given($ARGV[0]){
	when ('Fred') {say 'Name is Fred'; continue}
	when (/fred/i) {say 'Name has fred in it'; continue}
	when (/\AFred/) {say 'Name starts with Fred'}
	default 		{say "I don't see a Fred"}
}


foreach (`who`){
	my ($user, $tty, $date) = /(\S+)\s+(\S+)\s+(.*)/;
	$ttys{$user} .= "$tty at $date.\n";
	print $ttys{$user};
}


my @odd = grep {$_ % 2} 1..1000;
my @matching_lines = grep {/\bfred\b/i} <$fh>; 
my @matching_lines = grep /\bfred\b/i, <$fh>;

my $lines_count = grep /\bfred\b/i, <$fh>; ## just the count.

my @formated_data = map {&big_money($_)} @data;


print "some powers of two are: \n",
map "\t".(2**$_)."\n",0..15;


use List::MoreUtils qw(natatime);

my @array = (1..100);
my $iterator = natatime 4, @array;
while (my @tried = $iterator->()){
	print "Got @tried.\n";
}


use Benchmark;
timethese(
	1_100_100_1,
	{
		'local' => q{ local $a = $_; $a *= 2; },
		'my' => q{ my $a = $_; $a *= 2;},
	}
);


sub do_params{
	my ($arg, $default) = @_;
	my %param = @default;
	my %input;

	if (ref $$arg[0] eq 'HASH'){
		%input = %{$$arg[0]};
	}
	else {
		%input = 
			map {$$default[$_ * 2], $$arg[$_]} 0..$#_;
	}
	@param{ keys %input} = values %input;
	\%param;
}
=cut 

my @textfiles = grep {-T} glob "/home/xukai/Desktop/*";
for (@textfiles){
	print "$_\n";
}
#print "@textfiles.\n";
print "\n\n";
my @executables = grep {-o and -x _} glob '*';
#print "@executables.\n";
for (@executables){
	print "$_\n";
}