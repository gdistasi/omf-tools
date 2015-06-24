#!/bin/bash

OMFVER="5.4"
for i in `cat topo53 | tr , " "`; do echo $i; ssh root@$i "rm -f /var/log/caserver.log /var/log/mesh.log /var/log/caagent.log /tmp/ditg-rec-log /tmp/tcpdump* /tmp/olsrd.log; /etc/init.d/omf-resctl-${OMFVER} stop; rm  /var/log/omf-resctl-${OMFVER}.log; /etc/init.d/omf-resctl-${OMFVER} start; service rsyslog stop; rm -f /var/log/*; service rsyslog start";  done

#find /tmp/ -user gdistasi -exec rm {} \;

if [[ "ORBIT" == $ENV ]]; then
  USER="gdistasi"
else  
  USER="root"
fi

find /tmp/ -maxdepth 1 -iname "default*" -uid `id $USER | ruby -nae 'puts $F[0].split("=")[1].split("(")[0]'` -exec rm \{\} \;
