#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    if [ -e /Applications/iTerm.app ]; then
        echo "🖥  iTermはすでにインストールされています."
        return
    fi
    echo "⬇️  iTermをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://iterm2.com/downloads/stable/iTerm2-3_3_7.zip"
    if [ -e iTerm2-3_3_7.zip ]; then
        echo "📦  イメージをマウントしています..."
        unzip iTerm2-3_3_7.zip >> /dev/null
        cp -r /Volumes/Firefox/iTerm.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/Firefox/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm Firefox_2071.0.dmg
}


function uninstall {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf Firefox.app
    echo "🧹 Removing remaining files..."
    rm -rf ~/Library/Application\ Support/Firefox/
    rm -rf ~/Library/Caches/Firefox/
    rm -f ~/Library/Preferences/org.mozilla.firefox.plist
    echo "🧹 Firefox has been uninstalled!"
}


function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}
