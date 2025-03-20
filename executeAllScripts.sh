#!/bin/bash

git submodule update --init

./installEnvironment.sh
./createSymbolicLinks.sh
./appendToBashrc.sh
