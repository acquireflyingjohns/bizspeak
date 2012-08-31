#!/bin/bash

function randomize {
	read pattern
	for word in $pattern
	do
		if [ "$word" = "VERB" ];then
			shuf -n1 rand.verbs
		elif [ "$word" = "ADV" ];then
			shuf -n1 rand.adv
		elif [ "$word" = "ADJ" ];then
			shuf -n1 rand.adj
		elif [ "$word" = "NOUN" ];then
			shuf -n1 rand.nouns
		else
			echo $word
		fi
	done | tr "\n" " "
}

echo "VERB your ADJ NOUN with ADV ADJ NOUN in a ADJ NOUN and ADV VERB your NOUN" | randomize  |  sed 's/^./\U&/g' | sed 's/ $/\.\n/g' 
