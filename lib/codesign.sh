#!/usr/bin/env bash


verify_script() {
    echo "🔑  Verifying script..."

    curl --silent -O $2 >> /dev/null
       
    gpg --quiet --verify $1.sig $1 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "" >> /dev/null
    else
        echo "❌  Invalid signature!"
        exit 1
    fi
}
