#!/bin/bash
# deployed by ansible!

set -e

input=$1
restoredir=$2
stripcomponents=$3

if [ -z $input ]; then
  echo "usage: $0 <input.tgz.enc> <restoredir> <stripcomponents arg>"
  exit 123
fi

if ! [ -f $input ]; then
  echo "input file '$input' does not exist!"
  exit 123
fi

if [ -z $restoredir ]; then
  restoredir=./
fi

if [ -z $stripcomponents ]; then
  stripcomponents=0
fi


read -s -p "pass: "   pass ; echo

cipher=-aes-256-cbc

openssl enc \
  -d "$cipher" \
  -pass "pass:$pass" \
  -in $input \
| tar -xz \
  -C $restoredir \
  --strip-components $stripcomponents \


#-out restore/me.tar \
