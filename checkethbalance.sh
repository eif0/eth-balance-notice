#!/bin/bash
export DISPLAY=:0

while [ "$1" != "" ]; do
    case $1 in
        -a | --address )        shift
                                addr=$1
                                ;;
        -b | --balance )        shift
				balance=$1
                                ;;
    esac
    shift
done

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script="python3 $path/checkethbalance.py -a "$addr
current_balance=$($script)

if [ "$balance" != "$current_balance" ]
then
	zenity --error --text="BALANCE MODIFIED!!!!\nNEW BALANCE: "$balance
fi

exit 0
