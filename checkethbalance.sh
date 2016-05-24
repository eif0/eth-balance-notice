#!/bin/bash
export DISPLAY=:0

function usage
{
    echo "Usage: 
    - Compare addr balance and notify:
        $ ./checkethbalance.sh -a [address] -b [balance]
    - Print addr balance:
        $ ./checkethbalance.sh -a [address] -p
    - Print help:
        $ ./checkethbalance.sh -h"
}

addr=""
show=0
while [ "$1" != "" ]; do
    case $1 in
        -a | --address )        shift
                                addr=$1
                                ;;
        -b | --balance )        shift
				                balance=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        -p | --print )          show=1
                                ;;                              
        * )                     usage
                                exit 1
    esac
    shift
done

if [[ "$addr" == "" ]]; then
    usage
    exit 1
fi

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script="python3 $path/checkethbalance.py -a "$addr
current_balance=$($script)

if [ "$current_balance" == "ERROR" ]
then
    echo "ERROR: The wallet doesn't exist or doesn't have transactions in the blockchain."
    exit 0
elif [[ "$current_balance" != "$balance" ]]; then
    if [[ $show == 0 ]]; then
    	zenity --error --text="BALANCE MODIFIED!!!!\n\nBalance: "$current_balance" ETH"
    else
        echo $current_balance
    fi
fi

exit 0

