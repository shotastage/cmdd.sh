#!/usr/bin/env bash

if [ -e $HOME/.setuptools/ ]; then
    cd
    rm -rf .setuptools/
    exit 0
fi

echo "setuptools doesn't exists!"
exit 1
