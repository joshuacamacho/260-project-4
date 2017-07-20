#!/bin/bash
alpha() {
 while (( 1 ))
 do
 echo '(1) Firstname'
 echo '(2) Lastname'
 read input
 case $input in
  "1")
  sort -t':' -k1 $file
  break
  ;;
  "2")
  sort -t' ' -k2 $file
  break
  ;;
  *)
  echo 'invalid input'
  ;;
 esac
 done
}

reverse() {
 while (( 1 ))
 do
 echo '(1) Firstname'
 echo '(2) Lastname'
 read input
 case $input in
  "1")
  sort -t':' -k1r $file
  break
  ;;
  "2")
  sort -t' ' -k2r $file
  break
  ;;
  *)
  echo 'invalid input'
  ;;
 esac
 done
}

lastname() {
  echo 'Enter last name to enter'
  read input
  
  grep "^[A-Z][a-z]* $input:" $file
}

birthday(){
 echo '(1) Search by month'
 echo '(2) Search by year'
 read input
 case $input in
  "1")
   echo "enter month"
   read month
   grep ":$month/[0-9]*/[0-9]*:" $file
  ;;
  "2")
   echo "enter year"
   read year
   grep ":[0-9]*/[0-9]*/$year:" $file
  ;;
  *)
  echo 'Wrong input'
 esac
}

if [ ! -f $1 ] 
 then
  echo 'File doesnt exist'
  exit
fi
file=$1
while (( 1 ))
do
 echo "Enter the following"
 echo "(1) Display records in alphabetical order"
 echo "(2) Display records in reverse alphabetical"
 echo "(3) Search for record by Last Name"
 echo "(4) Search for a record by birthday"
 echo "(5) Exit" 
 read input
 case $input in
  "1")
  alpha
  ;;
  "2")
  reverse
  ;;
  "3")
  lastname
  ;;
  "4")
  birthday
  ;;
  "5")
  exit
  ;;
  *)
 esac
done
