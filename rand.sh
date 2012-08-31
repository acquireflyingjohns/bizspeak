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

memo=`echo "VERB your ADJ NOUN with ADV ADJ NOUN in a ADJ NOUN and ADV VERB your NOUN" | randomize  |  sed 's/^./\U&/g' | sed 's/ $/\.\n/g' | sed 's/CRNL/\n/g'`

echo $memo

if [ "$1" = "-l" ];then
        	# now fetch a "relevant" gartner URL to go along with your awesome memo
        
        # strip out stopwords and grab only first 3 bizspeak terms (too many and you won't get google results with site:...)
        # occasionally the <cite> result will have elipsis dots or the search terms will be so nonsensical that you
        # won't get a link, in which case we'll just link to the gartner research page
        searchstr=`echo $memo | sed -e 's/ your / /g' -e 's/ and / /g' -e 's/ with / /g' -e 's/ in a / /g' | cut -d' ' -f1,2,3 |tr " " "+"`
        
        link=`wget -q -U "Mozilla/5.001" -O - "http://www.google.com/search?q=site:gartner.com+$searchstr&num=100&start=200" | awk -vRS="</cite>" '/<cite>/{gsub(/.*<cite>/,"");print}' |grep gartner.com|head -5|shuf -n 1`
        
        if echo $link | grep -q '\.\.\.' ;then
        	echo http://www.gartner.com/technology/research.jsp
        elif [ "$link" != "" ];then
        	echo $link
        else
        	echo http://www.gartner.com/technology/research.jsp
        fi
        
fi


