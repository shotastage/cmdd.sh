#!/usr/bin/env bash

WORKING_DIRECTORY=~/.setuptools

function initialize {
    if [ -e $WORKING_DIRECTORY ]; then
        echo "Date: $(date)    User: $(whoami)" >> $WORKING_DIRECTORY/exec_user_log
    else
        make_directories
    fi
}


function prepare_workspace {
    [ -d $WORKING_DIRECTORY ] || mkdir $WORKING_DIRECTORY
    [ -d $WORKING_DIRECTORY/strategies/ ] || mkdir -p $WORKING_DIRECTORY/strategies/
    [ -d $WORKING_DIRECTORY/toolchains/ ] || mkdir -p $WORKING_DIRECTORY/toolchains/
    [ -d $WORKING_DIRECTORY/config/ ] || mkdir -p $WORKING_DIRECTORY/config/
    [ -d $WORKING_DIRECTORY/bin/ ] || mkdir -p $WORKING_DIRECTORY/bin/
}
