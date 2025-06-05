#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Korištenje: $0 <dozvole> <putanja_do_datoteke>"
    exit 1
fi

DOZVOLE=$1
DATOTEKA=$2

convert_to_octal() {
    local perm=$1
    local octal=""
    
    owner=0
    [ "${perm:0:1}" = "r" ] && owner=$((owner + 4))
    [ "${perm:1:1}" = "w" ] && owner=$((owner + 2))
    [ "${perm:2:1}" = "x" ] && owner=$((owner + 1))
    
    group=0
    [ "${perm:3:1}" = "r" ] && group=$((group + 4))
    [ "${perm:4:1}" = "w" ] && group=$((group + 2))
    [ "${perm:5:1}" = "x" ] && group=$((group + 1))
    
    other=0
    [ "${perm:6:1}" = "r" ] && other=$((other + 4))
    [ "${perm:7:1}" = "w" ] && other=$((other + 2))
    [ "${perm:8:1}" = "x" ] && other=$((other + 1))
    
    echo "${owner}${group}${other}"
}

OCTALNE_DOZVOLE=$(convert_to_octal "$DOZVOLE")

chmod "$OCTALNE_DOZVOLE" "$DATOTEKA"

echo "Oktalna reprezentacija: $OCTALNE_DOZVOLE"