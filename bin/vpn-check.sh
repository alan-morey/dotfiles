#!/bin/sh

CONNECTION_UUID="88ab8f9a-6a09-4e33-ad9b-1e5c0a26ceac"

nmcli con status | grep $CONNECTION_UUID
STATUS=$?

if [ "$STATUS" -eq "0" ] ; then
	echo "VPN Already UP"
else
	# VPN is down, reconnect
	nmcli con up uuid $CONNECTION_UUID
fi