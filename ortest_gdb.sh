#!/bin/bash

if [[ ! -f or.txt ]]; then
    echo "FAIL: or.txt file not present"
    echo "0/1"
    exit -1
fi

#expected value of rax after one pass of OR_FRAG in ortest binary
#need to find this value using gdb
EXPECTED="0xYOUR_EXPECTED_VALUE_HERE"

ACTUAL=$(cat or.txt)

if [[ "$ACTUAL" == "$EXPECTED" ]]; then
    echo "PASS"
    echo "1/1"
else
    echo "FAIL"
    echo "0/1"
fi
