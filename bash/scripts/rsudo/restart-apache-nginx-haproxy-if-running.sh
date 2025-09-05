#!/bin/bash

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

[[ $(pgrep apache > /dev/null; echo $?) -eq 0  && $(type apache2ctl &> /dev/null; echo $?) -eq 0 ]] && apache2ctl configtest && apache2ctl -k graceful && service apache2 status
[[ $(pgrep haproxy > /dev/null; echo $?) -eq 0 ]] && haproxy -f /etc/haproxy/hosts/$(hostname).cfg -c && service haproxy reload && service apache2 status
[[ $(pgrep nginx > /dev/null; echo $?) -eq 0 ]] && nginx -t && service nginx reload && service nginx status
