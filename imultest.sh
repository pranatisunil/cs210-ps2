#!/bin/bash
#set -x
# Simple script to test the imul assembly fragment

# assemble imultest.S into imultest.o
if [[ -a imultest.o ]]; then rm imultest.o; fi
make imultest.o
# assemble imul.S into imul.o
if [[ -a imul.o ]]; then rm imul.o; fi
make imul.o
# link imultest.o and imul.o into imultest
if [[ -a imultest ]]; then rm imultest; fi
make imultest

if [[ ! -a imultest ]]; then
    echo "FAIL: imultest not made"
    echo "0/2"
    exit -1
fi

# delete output file if it exits
if [[ -a imul.resbin ]]; then rm imul.resbin; fi

# run gdb with commands feed from standard input
# using bash here docment support
# https://www.gnu.org/software/bash/manual/bash.html#Here-Documents
# both standard ouput and error are sent to /dev/null so things are quiet
echo "running gdb ... you will have to look in $0 to see what we are doing"

gdb imultest >/dev/null 2>&1 <<EOF
b _start
run
delete 1
set \$rip=test1
c
dump binary value imul.resbin { \$rax, *((long long *)&IMUL_POSITIVE), *((long long *)&IMUL_NEGATIVE) }
set \$rip=test2
c
append binary value imul.resbin { \$rax, *((long long *)&IMUL_POSITIVE), *((long long *)&IMUL_NEGATIVE) }
set \$rip=test3
c
append binary value imul.resbin { \$rax, *((long long *)&IMUL_POSITIVE), *((long long *)&IMUL_NEGATIVE) }
set \$rip=test4
c
append binary value imul.resbin { \$rax, *((long long *)&IMUL_POSITIVE), *((long long *)&IMUL_NEGATIVE) }
quit
EOF

if [[ $(xxd -ps -g8 imul.resbin) == '851400000000000086140000000000000100000000000000e62aefffffff
ffff86140000000000002fffffffffffffff06a95cf4ffffffff37150000
000000002ffffffffffffffffa56a30b0000000037150000000000002eff
ffffffffffff' ]]; then
    echo PASS
    echo 2/2
else
    echo FAIL
    echo 0/2
fi
