#!/usr/bin/env bash

STRATEGY_VERSION="v001"
CURRENT_ID="1274495053"


function install {
    brew update
    brew install mas
    mas install $CURRENT_ID
}

function uninstall {
    mas uninstall $CURRENT_ID
}

function update {
    mas upgrade $CURRENT_ID
}

function main {
    install
}
