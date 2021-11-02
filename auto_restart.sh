
#!/bin/bash

if [ ! `pgrep SperoCoind` ] ; then
SperoCoind -datadir=/coin/data -conf=/coin/sperocoin.conf
fi
exit

