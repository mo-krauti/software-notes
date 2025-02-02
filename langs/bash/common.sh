#!/bin/bash
set -euxo pipefail

if [ $(whoami) = 'root']; then
  echo root
fi;

if [ 1 -gt 0]; then
  echo true
fi;
