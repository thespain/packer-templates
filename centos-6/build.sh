#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd -P)"
cd $DIR

if [ "$#" -ne 1 ]; then
  echo "usage: $0 [virtualbox|vmware]"
  exit 1
fi

case "$1" in
  virtualbox|vmware )
    builder=$1
    rm -f boxes/*${builder}*
    rm -rf output-${builder}*
    ;;
  * )
    echo "The only builders that are currently supported are virtualbox and vmware."
    exit 1
esac

../centos-common/build.sh $builder 6
