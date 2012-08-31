bizspeak
========

Bizspeak Generator

1. put all files in the same directory or modify the location of the rand.* file references in rand.sh

2. To generate a simple bizspeak memo:

./rand.sh

3. To generate a simple bizspeak memo with a somewhat relevant Gartner URL underneath it:

./rand.sh -l

3. Copy into a memo and send!


To Do:
1. Figure out how to better cull links from google results page. Currently using what's in <cite>.*</cite> but they shorten longer URLs with elipsis dots.
