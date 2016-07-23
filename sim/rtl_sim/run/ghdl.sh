#!/bin/bash

make -f ../bin/$1.mk TEST=$2 clean
make -f ../bin/$1.mk TEST=$2 init
make -f ../bin/$1.mk TEST=$2 run

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running for $SECONDS $units."
exit 0
