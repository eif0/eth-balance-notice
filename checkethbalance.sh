#!/bin/bash
export DISPLAY=:0
balance="$(python3 ~/apps/checkethbalance.py)"
presale_balance="706245000000000000001"
if [ "$balance" != "$presale_balance" ]
then
	zenity --error --text="PRE SALE BALANCE MODIFIED!!!!"
fi

exit 0
