# Filename : mti.sh
# Author   : Nikolaos Kavvadias 2012, 2013, 2014, 2015, 2016
# Copyright: (C) Nikolaos Kavvadias

#!/bin/bash

##########################################################################
# Script for running a Mentor Modelsim (MTI) simulation.
# USAGE:
# ./mti.sh $1 $2
# where:
# $1: is the package or entity name to be tested (ratpack).
# $2: is the version of the .do script to be invoked
#     (e.g. 1 for ratpack_tb1, 2 for ratpack_tb2).
#  
# Run with option -help for obtaining usage help.
##########################################################################

E_NOTFOUND=81
E_PRINTUSAGE=83

function print_usage () {
  echo "Script for running a Mentor Modelsim (MTI) simulation."
  echo "Author: Nikolaos Kavvadias (C) 2012-2020"
  echo "Copyright: (C) 2012-2020 Nikolaos Kavvadias"
  echo "Usage: ./mti.sh \$1 \$2"
  echo "where:"
  echo "  \$1: is the package or entity name to be tested (ratpack)."
  echo "  \$2: is the version of the .do script to be invoked"
  echo "       (e.g. 1 for ratpack_tb1, 2 for ratpack_tb2)."
  echo "Run with option -help for obtaining usage help."
}

if [ "$1" == "-help" ]
then
  print_usage;
  exit $E_PRINTUSAGE
fi

vhdlpkgname=$1

##########################################################################
# Run Mentor Modelsim simulation.
vsim -c -do "../bin/$1_tb$2.do"
##########################################################################

# Generate statistics.
if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running for $SECONDS $units."
