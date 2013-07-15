#!/usr/bin/perl

print "请输入一个字符串：\n";
$string = <STDIN>;
print "请输入一个数字：\n";
$n = <STDIN>;
$re = $string x $n;
print "结果是：\n$re";
