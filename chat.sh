#!/bin/bash

echo "Enter the password:"
read pass
echo -n "Your pid is "
echo $$
echo "Enter your interlocutor's  PID:"
read pid

touch doc.txt
openssl enc -aes-256-cbc -salt -in doc.txt -out doc.txt.enc -iter 100000 -k pass
rm -f doc.txt
trap "touch doc.txt; openssl enc -aes-256-cbc -d -in doc.txt.enc -out doc.txt -iter 100000 -k pass; cat doc.txt; rm -f doc.txt" 8
while true
do
	read msg
	openssl enc -aes-256-cbc -d -in doc.txt.enc -out doc.txt -iter 100000 -k pass
	echo -n $$ > doc.txt
	echo ": $msg" >> doc.txt
	openssl enc -aes-256-cbc -salt -in doc.txt -out doc.txt.enc -iter 100000 -k pass
	rm -f doc.txt
	kill -8 $pid
done
