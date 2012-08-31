#!/bin/bash

function randomize {
	read pattern
	for w in `echo $pattern`
	do
		r=$RANDOM

		if [ "$w" = "VERB" ];then
			nl=`wc rand.verbs|awk '{print $1}'`
			l=`expr $r % $nl + 1`
			awk "NR==${l}" rand.verbs
		elif [ "$w" = "ADV" ];then
			nl=`wc rand.adv|awk '{print $1}'`
			l=`expr $r % $nl + 1`
			awk "NR==${l}" rand.adv
		elif [ "$w" = "ADJ" ];then
			nl=`wc rand.adj|awk '{print $1}'`
			l=`expr $r % $nl + 1`
			awk "NR==${l}" rand.adj
		elif [ "$w" = "NOUN" ];then
			nl=`wc rand.nouns|awk '{print $1}'`
			l=`expr $r % $nl + 1`
			awk "NR==${l}" rand.nouns
		else
			echo $w
		fi
	done
}

export -f randomize
 
cat - <<EOF | randomize | xargs | sed 's/^./\U&/g' | sed 's/$/\./g' 
VERB your ADJ NOUN with ADV ADJ NOUN in a ADJ NOUN and ADV VERB your NOUN
EOF
