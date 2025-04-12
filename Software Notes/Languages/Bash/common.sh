#!/bin/bash
set -euxo pipefail

# if
if [ $(whoami) = 'root']; then
  echo root
fi;

if [ 1 -gt 0]; then
  echo true
fi;

# for loop
for i in $(seq 1 10);
do
    echo $i
done

