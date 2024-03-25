#!/bin/bash


find ./ -type f \( -iname \*.jpg -o -iname \*.png \) -printf "%P\0" | sort -z | while read -rd $'\0' file
do
    read width height < <(identify -format "%w %h" "${file}")
    echo "${width},${height}"
done   
