#!/bin/bash
INITD=$(type systemctl &> /dev/null; echo $?)
if [[ $INITD -eq 1 ]]; then
   service ntp stop; ntpd -gq; service ntp start; service ntp status;
elif [[ $INITD -eq 0 ]]; then
   systemctl stop ntp; ntpd -gq; systemctl start ntp; systemctl status ntp;
fi
