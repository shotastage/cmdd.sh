#!/usr/bin/env bash

STRATEGY_VERSION="v001"


. $HOME/.setuptools/lib/network.sh

install() {
    if [ -e /Applications/Opera.app ]; then
        echo "🖥  Operaはすでにインストールされています."
        return
    fi
    echo "⬇️  Operaをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    download "https://net.geo.opera.com/opera/stable/mac?utm_tryagain=yes&utm_source=google_via_opera_com&utm_medium=ose&utm_campaign=(none)_via_opera_com_https&http_referrer=https%3A%2F%2Fwww.google.co.jp%2F&utm_site=opera_com" OperaSetup.zip
    if [ -e OperaSetup.zip ]; then
        echo "📦  インストーラを展開しています..."
        unzip OperaSetup.zip >> /dev/null
        echo "🚀  インストーラを起動しています..."
        open -W Opera\ Installer.app
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  クリーンアップしています..."
    rm OperaSetup.zip
    rm -rf Opera\ Installer.app
    rm ._Opera\ Installer.app
}

uninstall() {
    cd /Applications/
    rm -rf Opera.app
    echo "🧹 Opera has been uninstalled!"
}

update() {
    echo "NOW UNDER CONSTRUCTION"
}

main() {
    install
}
