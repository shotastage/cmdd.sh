#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh
. $HOME/.setuptools/lib/codesign.sh


WORKING_DIRECTORY=~/.setuptools
MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)"
TASK_MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/$(operating_system)"


execute() {
    cd $WORKING_DIRECTORY/strategies/
    curl --silent -O "${MASTER_URL}/${2}.sh"
    chmod +x ${2}.sh

    # verify_script ${2}.sh "https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)/signatures/${2}.sh.sig"
    echo "Signature verifying is currently skipped!"

    . ${2}.sh

    if [ ${1} = "install" ]; then
        install
    fi

    if [ ${1} = "update" ]; then
        update
    fi

    if [ ${1} = "uninstall" ]; then
        uninstall
    fi

    if [ ${1} = "open" ]; then
        open
    fi

    if [ ${1} = "detail" ]; then
        echo $DESCRIPTION
    fi

    if [ ${1} = "help" ]; then
        echo $HELP
    fi
}


exetask() {

    # Check task directory preparation
    if [ ! -e $WORKING_DIRECTORY/tasks/ ]; then
        mkdir $WORKING_DIRECTORY/tasks/
    fi

    # Download script
    curl --silent "${TASK_MASTER_URL}/${1}.sh" -o $WORKING_DIRECTORY/tasks/${1}.sh
    chmod +x $WORKING_DIRECTORY/tasks/${1}.sh
    # verify_taskscript ${1}.sh "https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/$(operating_system)/signatures/${1}.sh.sig"

    . $WORKING_DIRECTORY/tasks/${1}.sh

    uptask
}
