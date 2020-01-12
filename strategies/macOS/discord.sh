#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

function install {
    if [ -e /Applications/Discord.app/ ]; then
        echo "🖥  Discordはすでにインストールされています."
        return
    fi
    echo "⬇️  Discordをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://dl.discordapp.net/apps/osx/0.0.255/Discord.dmg"
    if [ -e Discord.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg Discord.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Discord/Discord.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Discord"
    echo "🧹  クリーンアップしています..."
    rm Discord.dmg
}

function uninstall {
    cd /Applications/
    rm -rf Discord.app
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
