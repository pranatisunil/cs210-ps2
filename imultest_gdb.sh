#!/bin/bash
if [[ ! -f imul.txt ]]; then
    echo "FAIL: imul.txt file not present"
    echo "0/1"
    exit -1
fi

#expected value at data_start in imultest binary
#you need to find this value using gdb
EXPECTED="0xYOUR_EXPECTED_VALUE_HERE"

ACTUAL=$(cat imul.txt)

if [[ "$ACTUAL" == "$EXPECTED" ]]; then
    echo "PASS"
    echo "1/1"
else
    echo "FAIL"
    echo "0/1"
fi
