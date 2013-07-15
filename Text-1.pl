#! /usr/bin/perl

use 5.010;

=pod
print <<'EOS';
Dear $j $h,

you may have just won $m!
EOS
=cut

=pod
open my ($passwd), '<', '/etc/passwd' or die;
my @by_uid = 
    map {$_->[0]}
    sort {$a->[1]<=>$b->[1]}
    map {[$_, (split /:/)[2]]} <$passwd>;       ##施瓦茨变换(从下往上处理)##前后两个$_不一样

print "@by_uid";
=cut


#my ($name, $value) = /^([^:]*):\s*(.*)/;

#my $subject = (/^subject:\s+(re:\s*)?(.*)/i)[1];

$_ = 'Buster and Buster';
print "$_\n";
if(/(?<first>\S+) (and|or) \k<first>/){  
    say "I saw the same name $+{first} twice!";
}