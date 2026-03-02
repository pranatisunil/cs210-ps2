#!/bin/bash

if [[ ! -f and.txt ]]; then
    echo "FAIL: and.txt file not present"
    echo "0/1"
    exit -1
fi

# expected value from the second 8-byte at _start in andtest binary
# need to find this value using gdb
EXPECTED="0xYOUR_EXPECTED_VALUE_HERE"

ACTUAL=$(cat and.txt)

if [[ "$ACTUAL" == "$EXPECTED" ]]; then
    echo "PASS"
    echo "1/1"
else
    echo "FAIL"
    echo "0/1"
fi
