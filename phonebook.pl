#!/usr/bin/perl
use strict;

my $file = $ARGV[0];
if(!$file){
 print "need command line argument containing file\n";
 exit
}
while (1) {
print "(1) List Alphabetically\n";
print "(2) List Reverse Alphabetically\n";
print "(3) Search by last name\n";
print "(4) Search by birtday\n";
print "(5) Exit\n";
my $input = <STDIN>;

 if ($input==1){
  print "(1) Firstname\n";
  print "(2) Lastname\n";
  my $val = <STDIN>;
  if($val==1){
   system("sort -t':' -k1 $file");
  } elsif ($val==2){
   system("sort -t' ' -k2 $file");
  }
 } elsif ($input == 2) {
  print "(1) Firstname\n";
  print "(2) Lastname\n";
  my $val = <STDIN>;
  if($val==1){
   system("sort -t':' -k1r $file");
  } elsif ($val==2){
   system("sort -t' ' -k2r $file");
  }

 } elsif ($input == 3) {
  print "Enter last name";
  my $val = <STDIN>;
  chomp($val);
  system("grep '^[A-Z][a-z]* $val:' $file");
 } elsif ($input == 4) {
  print "(1) Month";
  print "(2) Year";
  my $val = <STDIN>;
   if($val==1){
    print "Enter month";
    my $month = <STDIN>;
    chomp($month);
    system("grep ':$month/[0-9]*/[0-9]*:' $file");
   } elsif ($val==2){
    print "Enter year";
    my $year = <STDIN>;
    chomp($year);
    system("grep ':[0-9]*/[0-9]*/$year:' $file");
   }
 } elsif ($input == 5) {
  exit
 } else {
 
 }

}
