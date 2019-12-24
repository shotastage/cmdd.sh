#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

function install {
    if [ -e /Applications/Google\ Chrome.app/ ]; then
        echo "🖥  Chromeはすでにインストールされています."
        return
    fi
    echo "⬇️  Chromeをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg"
    if [ -e googlechrome.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg googlechrome.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Google Chrome"
    echo "🧹  クリーンアップしています..."
    rm googlechrome.dmg
}

function uninstall {
    cd /Applications/
    rm -rf Google\ Chrome.app
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
