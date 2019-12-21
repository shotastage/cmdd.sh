#!/usr/bin/env bash

STRATEGY_VERSION="v001"


. ~/.setuptools/lib/foundation.sh
. ~/.setuptools/lib/network.sh


function install {
    if [ -e /Applications/Telegram.app ]; then
        echo "🖥  Telegramはすでにインストールされています."
        return
    fi
    echo "⬇️  Telegramをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://osx.telegram.org/updates/TelegramMac.dmg"
    if [ -e TelegramMac.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmgTelegramMac.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Telegram/Telegram.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg Telegram
    echo "🧹  クリーンアップしています..."
    rm TelegramMac.dmg
}


function uninstall {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf Telegram.app
    echo "🧹 Removing remaining files..."
    # rm -rf ~/Library/Application\ Support/Firefox/
    # rm -rf ~/Library/Caches/Firefox/
    # rm -f ~/Library/Preferences/org.mozilla.firefox.plist
    echo "🧹 Telegram has been uninstalled!"
}


function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}
