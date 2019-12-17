#!/usr/bin/env bash


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
    rm -rf Firefox.app
    echo "🧹 Removing remaining files..."
    rm -rf ~/Library/Application\ Support/Firefox/
    rm -rf ~/Library/Caches/Firefox/
    rm -f ~/Library/Preferences/org.mozilla.firefox.plist
    echo "🧹 Firefox has been uninstalled!"
}


function main {
    install
}
