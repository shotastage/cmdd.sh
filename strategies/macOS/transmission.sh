#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    if [ -e /Applications/Transmission.app ]; then
        echo "🖥  Transmissionはすでにインストールされています."
        return
    fi
    echo "⬇️  Transmissionをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://github.com/transmission/transmission-releases/raw/master/Transmission-2.94.dmg"
    if [ -e Transmission-2.94.dmg ]; then
        echo "💿  イメージをマウントしています..."
        hdiutil mount Transmission-2.94.dmg >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Transmission/Transmission.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/Transmission/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm Transmission-2.94.dmg
}


function uninstall {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf Transmission.app
    echo "🧹 Removing remaining files..."
    rm -rf ~/Library/Application Support/Transmission
    rm -rf ~/Library/Caches/org.m0k.transmission
    rm -rf ~/Library/Preferences/org.m0k.transmission.plist
    echo "🧹 Transmission has been uninstalled!"
}


function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}
