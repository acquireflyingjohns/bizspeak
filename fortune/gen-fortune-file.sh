#!/bin/bash

# Generates fortune compatible databases full of bizspeak!

cd ..
for e in `seq 1 1000`
do
	./rand.sh 
	echo "%"
done >> fortune/bizspeak
cd fortune
strfile bizspeak bizspeak.dat

echo ""
echo Run this commands to get your new fortune database:
echo sudo mv bizspeak bizspeak.dat /usr/share/games/fortunes/
echo ""
echo fortune bizspeak
