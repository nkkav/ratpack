#!/bin/bash

make -f ../bin/$1.mk TEST=$2 clean
make -f ../bin/$1.mk TEST=$2 init
make -f ../bin/$1.mk TEST=$2 run

cmp -s ratpack_results$2.txt ../out/ratpack_results$2.txt
STATUS=$?
if [ $STATUS -eq 0 ]; then
  echo "PASS!"
  # match
elif [ $STATUS -eq 1 ]; then
  echo "FAIL"
  exit 88
  # compare
else
  echo "ERROR. Unexpected result when comparing to the reference output!"
  exit 89
fi

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running for $SECONDS $units."
