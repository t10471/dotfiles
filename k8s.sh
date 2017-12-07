#!/bin/bash

array=( $(kubectl config current-context | tr '_' ' ') )
last_index=`expr ${#array[@]} - 1`
x=${array[${last_index}]}
echo $x | sed -e "s/-cluster//g"
