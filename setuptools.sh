#!/usr/bin/env bash
set -e

. lib/workspace.sh
. lib/executor.sh


WORKING_DIRECTORY=~/.setuptools/


function splash {
    echo "setuptools 1.0.0"
    echo "Copyright (C) 2019 Shota Shimazu, All rights reserved."
    echo
}


function in_workspace {
    cd $WORKING_DIRECTORY
}


splash
initialize
in_workspace

if [ ${1} = "install" ]; then
    execute install $2
    exit 0
fi


if [ ${1} = "uninstall" ]; then

    execute uninstall $2
    exit 0
fi


if [ ${1} = "show-user-log" ]; then
    cat $WORKING_DIRECTORY/exec_user_log
    exit 0
fi
