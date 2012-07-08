#!/bin/bash
wget http://webdiplomacy.net/board.php?gameID=93543 -O game.html -o /dev/null
B=`cat game.html | grep gameDate | sed 's/^.*<span class="gameDate">\([^<]*\)<\/span>.*<span class="gamePhase">\([^<]*\)<\/span>.*$/\1 \2/'`
echo $B > phase_new.txt
T=`date +%d-%m-%YT%H:%m`
#R=`diff phase.txt phase_new.txt`
if diff phase.txt phase_new.txt >/dev/null ; then
    echo $T Same Phase
  else
    echo $T New Phase: $B
    echo -e "Dear Friend!\n GHobbit reminds You about a New Phase.\n To see what happened look here: http://webdiplomacy.net/board.php?gameID=93543"  | mail -s "GHobbit: Webdiplomacy $B ($T)" your@email.com secon@email.com
fi
mv phase_new.txt phase.txt
rm game.html
